#ifndef __HWACC_STREAM_BUFFER_HH__
#define __HWACC_STREAM_BUFFER_HH__

#include "params/StreamBuffer.hh"
// #include "dev/io_device.hh"
#include "base/circlebuf.hh"
#include "sim/clocked_object.hh"
#include "hwacc/stream_port.hh"

class StreamBuffer : public ClockedObject {
  private:
  	StreamSlavePortT<StreamBuffer> streamPort;
  	Fifo<uint8_t> buffer;
  	size_t const fifoSize;
  	ByteOrder endian;
  	Addr streamAddr;
  	Addr streamSize;
  	Tick streamDelay;
  public:
  	typedef StreamBufferParams Params;
  	const Params *
    params() const
    {
      return dynamic_cast<const Params *>(_params);
    }

    StreamBuffer(Params *p);

  	size_t size() const { return buffer.size(); }
  	void flush() { buffer.flush(); }
  	bool canReadStream(size_t len);
  	bool canWriteStream(size_t len);
  	void readStream(uint8_t *dst, size_t len);
  	void writeStream(uint8_t *src, size_t len);
  	bool tryReadStream(uint8_t *dst, size_t len);
  	bool tryWriteStream(uint8_t *src, size_t len);

  	bool tvalid(PacketPtr pkt);

  	virtual Tick streamRead(PacketPtr pkt);
  	virtual Tick streamWrite(PacketPtr pkt);

  	AddrRangeList getStreamAddrRanges() const;

  	void serialize(CheckpointOut &cp) const override;
  	void unserialize(CheckpointIn & cp) override;
};

#endif // __HWACC_STREAM_BUFFER_HH__