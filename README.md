# SherlockMem

Memory usage tracer for GenServer processes.

## Installation

The package can be installed by adding `sherlock_mem` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:sherlock_mem, "~> 0.1.3"}]
end
```

## Basic Usage

- Add "use SherlockMem" in each GenServer module like this:

```elixir
defmodule Slack do
  use GenServer
  use SherlockMem
...
end
```

- At runtime enable tracing module by running in iex console:

```elixir
SherlockMem.enable(Slack)
```

- For each init callback there will be messages like this:

```console
print_mem_before <pid> <memory_used> "init_before" <initial arguments>
print_mem_after  <pid> <memory_used> "init_after " <final state>
```

- Library is wrapping standard GenServer callbacks: init, handle_cast, handle_call, handle_info

### More details

- default log level is info
- it's using recon to get current process memory usage
