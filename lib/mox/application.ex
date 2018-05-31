defmodule Mox.Application do
  @moduledoc false

  use Application

  def start(_, _) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Mox.Server, [])
    ]

    opts = [strategy: :one_for_one, name: Mox.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
