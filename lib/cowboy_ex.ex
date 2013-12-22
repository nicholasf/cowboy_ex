defmodule CowboyEx do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    {:ok, _} = :cowboy.start_http(:http_listener, 100,
                                  [port: 4000],
                                  [env: [dispatch: dispatch]])
    CowboyEx.Supervisor.start_link
  end

  def dispatch do
   :cowboy_router.compile([ {:_, [ {"/", Handler, []}, ]} ])
  end
end

defmodule Handler do
  def init(_transport, req, []) do
    {:ok, req, nil}
  end

  def handle(req, state) do
    {:ok, req} = :cowboy_req.reply(200, [], "hello!", req)
    {:ok, req, state}
  end

  def terminate(_reason, _req, _state), do: :ok
end

