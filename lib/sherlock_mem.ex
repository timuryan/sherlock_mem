defmodule SherlockMem do
  def enable(module) do
    Application.put_env(:sherlock_mem, :module, module)
  end

  def disable(_module) do
    Application.put_env(:sherlock_mem, :module, nil)
  end

  defmacro __using__(_opts) do
    quote do
      require Logger

      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      defoverridable init: 1, handle_cast: 2, handle_call: 3, handle_info: 2

      def init(state) do
        print_mem_before("init_before", state)
        response = super(state)
        print_mem_after("init_after", state)
        response
      end

      def handle_cast(msg, state) do
        print_mem_before("cast_before", msg)

        response = super(msg, state)

        print_mem_after("cast_after", msg)

        response
      end

      def handle_call(msg, from, state) do
        print_mem_before("call_before", msg)
        response = super(msg, from, state)
        print_mem_after("call_after", msg)
        response
      end

      def handle_info(msg, state) do
        print_mem_before("info_before", msg)
        response = super(msg, state)
        print_mem_after("info_after", msg)
        response
      end

      def check_module(module) do
        case Application.get_env(:sherlock_mem, :module) do
          ^module -> true
          _ -> false
        end
      end

      defp print_mem_before(context) do
        if check_module(__MODULE__) do
          Logger.info("print_mem_before #{inspect(self())} #{mem()} #{inspect(context)}")
        end
      end

      defp print_mem_before(context, msg) do
        if check_module(__MODULE__) do
          Logger.info(
            "print_mem_before #{inspect(self())} #{mem()} #{inspect(context)} #{inspect(msg)}"
          )
        end
      end

      defp print_mem_after(context) do
        if check_module(__MODULE__) do
          Logger.info("print_mem_after #{inspect(self())} #{mem()} #{inspect(context)}")
        end
      end

      defp print_mem_after(context, msg) do
        if check_module(__MODULE__) do
          Logger.info(
            "print_mem_after #{inspect(self())} #{mem()} #{inspect(context)} #{inspect(msg)}"
          )
        end
      end

      defp mem() do
        :recon.info(self)[:memory_used][:memory]
      end
    end
  end
end
