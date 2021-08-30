#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "bench.h"
#include "../../../common/m5ops.h"

bfs_struct bfs;

#define BASE            0x80c00000

#define NODES_OFFSET 0
#define EDGES_OFFSET NODES_OFFSET + sizeof(node_index_t) * N_NODES * 2
#define LEVEL_OFFSET EDGES_OFFSET + sizeof(edge_index_t) * N_EDGES
#define COUNT_OFFSET LEVEL_OFFSET + sizeof(level_t)      * N_NODES
#define CHECK_OFFSET COUNT_OFFSET + sizeof(edge_index_t) * N_LEVELS

volatile uint8_t      * top        = (uint8_t      *)0x2f000000;
volatile uint32_t     * NODES_ADDR = (uint32_t     *)0x2f000001;
volatile uint32_t     * EDGES_ADDR = (uint32_t     *)0x2f000009;
volatile uint32_t     * LEVEL_ADDR = (uint32_t     *)0x2f000011;
volatile uint32_t     * COUNT_ADDR = (uint32_t     *)0x2f000019;
volatile node_index_t * START_ADDR = (node_index_t *)0x2f000021;

int main(void) {
    node_index_t * nodes 			= (node_index_t *)(BASE + NODES_OFFSET);
    edge_index_t * edges 			= (edge_index_t *)(BASE + EDGES_OFFSET);
    level_t      * level 			= (level_t      *)(BASE + LEVEL_OFFSET);
    edge_index_t * level_counts 	= (edge_index_t *)(BASE + COUNT_OFFSET);
    edge_index_t * check 			= (edge_index_t *)(BASE + CHECK_OFFSET);
	stage = 0;
    volatile int count = 0;
    bfs.nodes = nodes;
    bfs.edges = edges;
    bfs.level = level;
    bfs.level_counts = level_counts;
    bfs.check = check;

    node_index_t starting_node = 38;

    printf("Generating data\n");
    genData(&bfs);
    printf("Data generated\n");

    *NODES_ADDR = (uint32_t)(void *)nodes;
    *EDGES_ADDR = (uint32_t)(void *)edges;
    *LEVEL_ADDR = (uint32_t)(void *)level;
    *COUNT_ADDR = (uint32_t)(void *)level_counts;
    printf("Starting node: %d\n", starting_node);
    *START_ADDR = starting_node;

    printf("Starting job\n");

    *top = 0x01;
    while (stage < 1) count++;

    printf("Job complete\n");

#ifdef CHECK
	bool fail = false;

    for (int i = 0; i < N_LEVELS; i++) {
        if (level_counts[i] != check[i]) {
            fail = true;
            break;
        }
    }
    if(fail)
        printf("Check Failed\n");
    else
        printf("Check Passed\n");
#endif
    m5_dump_stats();
    m5_exit();
}