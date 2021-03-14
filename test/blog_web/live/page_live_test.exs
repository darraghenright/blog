defmodule BlogWeb.PageLiveTest do
  @moduledoc false
  use BlogWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "home"
    assert render(page_live) =~ "home"
  end
end
