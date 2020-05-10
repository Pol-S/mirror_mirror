class Api::CharactersController < ApplicationController
  def index
    @all_characters = Character.all
    render "index.json.jb"
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
