################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

module CZMQ
  module FFI

    # Create and decode Open Sound Control messages. (OSC)
    #
    # OSC is a serialisation format (and usually transported over UDP) which is
    # supported by many applications and appliances. It is a de facto protocol
    # for networking sound synthesizers, computers, and other multimedia devices
    # for purposes such as musical performance or show control. It is also often
    # used for rapid prototyping purposes due to the support by many applications
    # and frameworks in this field. With ZeroMQ's DGRAM sockets it is possible
    # to use ZeroMQ to send and receive OSC messages which can be understood by
    # any device supporting OSC.
    #
    # Example creating an OSC message:
    #
    #     zosc_t* conm = zosc_create("/someaddress", "iihfdscF",
    #                         1, 2, 3, 3.14, 6.283185307179586, "greetings", 'q');
    #
    # Decoding a message:
    #
    #     int rc = zosc_retr(oscmsg, "iihfdscF", &intx, &inty, &intz, &floatz,
    #                         &doublez, &strings, &charq, &someBool);
    #
    # See the class's test method for more examples how to use the class.
    # @note This class is 100% generated using zproject.
    class Zosc
      # Raised when one tries to use an instance of {Zosc} after
      # the internal pointer to the native object has been nullified.
      class DestroyedError < RuntimeError; end

      # Boilerplate for self pointer, initializer, and finalizer
      class << self
        alias :__new :new
      end
      # Attaches the pointer _ptr_ to this instance and defines a finalizer for
      # it if necessary.
      # @param ptr [::FFI::Pointer]
      # @param finalize [Boolean]
      def initialize(ptr, finalize = true)
        @ptr = ptr
        if @ptr.null?
          @ptr = nil # Remove null pointers so we don't have to test for them.
        elsif finalize
          @finalizer = self.class.create_finalizer_for @ptr
          ObjectSpace.define_finalizer self, @finalizer
        end
      end
      # @param ptr [::FFI::Pointer]
      # @return [Proc]
      def self.create_finalizer_for(ptr)
        Proc.new do
          ptr_ptr = ::FFI::MemoryPointer.new :pointer
          ptr_ptr.write_pointer ptr
          ::CZMQ::FFI.zosc_destroy ptr_ptr
        end
      end
      # @return [Boolean]
      def null?
        !@ptr or @ptr.null?
      end
      # Return internal pointer
      # @return [::FFI::Pointer]
      def __ptr
        raise DestroyedError unless @ptr
        @ptr
      end
      # So external Libraries can just pass the Object to a FFI function which expects a :pointer
      alias_method :to_ptr, :__ptr
      # Nullify internal pointer and return pointer pointer.
      # @note This detaches the current instance from the native object
      #   and thus makes it unusable.
      # @return [::FFI::MemoryPointer] the pointer pointing to a pointer
      #   pointing to the native object
      def __ptr_give_ref
        raise DestroyedError unless @ptr
        ptr_ptr = ::FFI::MemoryPointer.new :pointer
        ptr_ptr.write_pointer @ptr
        __undef_finalizer if @finalizer
        @ptr = nil
        ptr_ptr
      end
      # Undefines the finalizer for this object.
      # @note Only use this if you need to and can guarantee that the native
      #   object will be freed by other means.
      # @return [void]
      def __undef_finalizer
        ObjectSpace.undefine_finalizer self
        @finalizer = nil
      end

      # Create a new empty OSC message with the specified address string.
      # @param address [String, #to_s, nil]
      # @return [CZMQ::Zosc]
      def self.new(address)
        ptr = ::CZMQ::FFI.zosc_new(address)
        __new ptr
      end

      # Create a new OSC message from the specified zframe. Takes ownership of
      # the zframe.
      # @param frame [Zframe, #__ptr]
      # @return [CZMQ::Zosc]
      def self.fromframe(frame)
        frame = frame.__ptr if frame
        ptr = ::CZMQ::FFI.zosc_fromframe(frame)
        __new ptr
      end

      # Create a new zosc message from memory. Take ownership of the memory
      # and calling free on the data after construction.
      # @param data [::FFI::Pointer, #to_ptr]
      # @param size [Integer, #to_int, #to_i]
      # @return [CZMQ::Zosc]
      def self.frommem(data, size)
        size = Integer(size)
        ptr = ::CZMQ::FFI.zosc_frommem(data, size)
        __new ptr
      end

      # Create a new zosc message from the given format and arguments.
      # The format type tags are as follows:
      #   i - 32bit integer
      #   h - 64bit integer
      #   f - 32bit floating point number (IEEE)
      #   d - 64bit (double) floating point number
      #   s - string (NULL terminated)
      #   t = timetag: an OSC timetag in NTP format (uint64_t)
      #   S - symbol
      #   c - char
      #   m - 4 byte midi packet (8 digits hexadecimal)
      #   T - TRUE (no value required)
      #   F - FALSE (no value required)
      #   N - NIL (no value required)
      #   I - Impulse (for triggers) or INFINITUM (no value required)
      #   b - binary blob
      # @param address [String, #to_s, nil]
      # @param format [String, #to_s, nil]
      # @param args [Array<Object>]
      # @return [CZMQ::Zosc]
      def self.create(address, format, *args)
        ptr = ::CZMQ::FFI.zosc_create(address, format, *args)
        __new ptr
      end

      # Destroy an OSC message
      #
      # @return [void]
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zosc_destroy(self_p)
        result
      end

      # Return chunk data size
      #
      # @return [Integer]
      def size()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zosc_size(self_p)
        result
      end

      # Return OSC chunk data. Caller does not own the data!
      #
      # @return [::FFI::Pointer]
      def data()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zosc_data(self_p)
        result
      end

      # Return the OSC address string
      #
      # @return [String]
      def address()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zosc_address(self_p)
        result
      end

      # Return the OSC format of the message.
      #   i - 32bit integer
      #   h - 64bit integer
      #   f - 32bit floating point number (IEEE)
      #   d - 64bit (double) floating point number
      #   s - string (NULL terminated)
      #   t = timetag: an OSC timetag in NTP format (uint64_t)
      #   S - symbol
      #   c - char
      #   m - 4 byte midi packet (8 digits hexadecimal)
      #   T - TRUE (no value required)
      #   F - FALSE (no value required)
      #   N - NIL (no value required)
      #   I - Impulse (for triggers) or INFINITUM (no value required)
      #   b - binary blob
      #
      # @return [String]
      def format()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zosc_format(self_p)
        result
      end

      # Retrieve the values provided by the given format. Note that zosc_retr
      # creates the objects and the caller must destroy them when finished.
      # The supplied pointers do not need to be initialized. Returns 0 if
      # successful, or -1 if it failed to retrieve a value in which case the
      # pointers are not modified. If an argument pointer is NULL is skips the
      # value. See the format method for a detailed list op type tags for the
      # format string.
      #
      # @param format [String, #to_s, nil]
      # @param args [Array<Object>] see https://github.com/ffi/ffi/wiki/examples#using-varargs
      # @return [Integer]
      def retr(format, *args)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zosc_retr(self_p, format, *args)
        result
      end

      # Create copy of the message, as new chunk object. Returns a fresh zosc_t
      # object, or null if there was not enough heap memory. If chunk is null,
      # returns null.
      #
      # @return [Zosc]
      def dup()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zosc_dup(self_p)
        result = Zosc.__new result, true
        result
      end

      # Transform zosc into a zframe that can be sent in a message.
      #
      # @return [Zframe]
      def pack()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zosc_pack(self_p)
        result = Zframe.__new result, true
        result
      end

      # Transform zosc into a zframe that can be sent in a message.
      # Take ownership of the chunk.
      #
      # @param self_p [#__ptr_give_ref]
      # @return [Zframe]
      def self.packx(self_p)
        self_p = self_p.__ptr_give_ref
        result = ::CZMQ::FFI.zosc_packx(self_p)
        result = Zframe.__new result, true
        result
      end

      # Transform a zframe into a zosc.
      #
      # @param frame [Zframe, #__ptr]
      # @return [Zosc]
      def self.unpack(frame)
        frame = frame.__ptr if frame
        result = ::CZMQ::FFI.zosc_unpack(frame)
        result = Zosc.__new result, true
        result
      end

      # Dump OSC message to stderr, for debugging and tracing.
      #
      # @return [void]
      def print()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zosc_print(self_p)
        result
      end

      # Probe the supplied object, and report if it looks like a zosc_t.
      #
      # @param self_ [::FFI::Pointer, #to_ptr]
      # @return [Boolean]
      def self.is(self_)
        result = ::CZMQ::FFI.zosc_is(self_)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zosc_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
