defmodule ElixirLS.LanguageServer.Providers.ExecuteCommand.Restart do
  require Logger

  @behaviour ElixirLS.LanguageServer.Providers.ExecuteCommand

  @impl ElixirLS.LanguageServer.Providers.ExecuteCommand
  def execute(_args, _state) do
    {:ok, _pid} =
      Task.start(fn ->
        Logger.info("ElixirLS restart requested")
        Process.sleep(1000)
        ElixirLS.LanguageServer.restart()
      end)

    {:ok, %{}}
  end
end
