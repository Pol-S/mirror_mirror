class Api::CharactersController < ApplicationController
  def index
    @all_characters = Character.all
    render "index.json.jb"
  end

  def show
    id = params["id"]
    @character = Character.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
  end

  def update
  end

  def destroy
  end
end
