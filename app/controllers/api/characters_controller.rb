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
    @character = Character.new({
      user_id: params[:user_id],
      name: params[:name],
      level: params[:level],
      character_class_id: params[:character_class_id],
      speciality: params[:speciality],
    })

    if @character.save
      render "show.json.jb"
    else
      render json: { message: "Character not saved" }
      # render json: { errors: @character.errors.full_message }, status: :unprocessable_entity
    end
  end

  def update
    @character = Character.find_by(id: params[:id])
    @character.name = params[:name] || @character.name
    @character.level = params[:level] || @character.level
    @character.character_class_id = params[:character_class_id] || @character.character_class_id
    @character.speciality = params[:speciality] || @character.speciality
    @character.add_spell(params[:new_spell_id])

    if @character.save
      render "show.json.jb"
    else
      render json: { message: "Character not saved" }
      # render json: { errors: @character.errors.full_message }, status: :unprocessable_entity
    end
  end

  def destroy
    character = Character.find_by(id: params[:id])
    character.destroy
    render json: { message: "Character failed death save." }
  end
end
