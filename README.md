# SherlockMem

## Memory tracer for GenServer 

- Add "use SherlockMem" in each GenServer module like this:

```elixir
defmodule Slack do
  use GenServer
  use SherlockMem
...
end

```

- At runtime enable tracing module by runing in iex console:

```elixir
SherlockMem.enable(Slack)
```
