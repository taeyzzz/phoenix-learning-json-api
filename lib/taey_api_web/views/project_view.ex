defmodule TaeyAPIWeb.ProjectView do
  use TaeyAPIWeb, :view
  alias TaeyAPIWeb.ProjectView

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, ProjectView, "project.json")}
  end

  def render("show.json", %{project: project}) do
    %{data: render_one(project, ProjectView, "project.json")}
  end

  def render("project.json", %{project: project}) do
    %{id: project.id,
      name: project.name,
      price: project.price}
  end
end
