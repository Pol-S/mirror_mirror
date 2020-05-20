class Api::CharactersController < ApplicationController
  def index
    @all_characters = Character.all
    render "index.json.jb"
  end

  def show
    id = params["id"]
    @character = Character.find_by(id: params[:id])
    @character.nuke_score = @character.nuke_calc
    @character.cc_score = @character.cc_calc
    @character.utility_score = @character.utility_calc
    @character.face_score = @character.face_calc
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
      @character.add_spell(params[:new_spell_id])

      @character.nuke_score = @character.nuke_calc
      @character.cc_score = @character.cc_calc
      @character.utility_score = @character.utility_calc
      @character.face_score = @character.face_calc
      @character.save
      # @character.score_calc
      render "show.json.jb"
    else
      render json: { message: "Character not saved" }
    end
  end

  def update
    @character = Character.find_by(id: params[:id])
    @character.name = params[:name] || @character.name
    @character.level = params[:level] || @character.level
    @character.character_class_id = params[:character_class_id] || @character.character_class_id
    @character.speciality = params[:speciality] || @character.speciality
    @character.add_spell(params[:new_spell_id])
    @character.nuke_score = @character.nuke_calc
    @character.cc_score = @character.cc_calc
    @character.utility_score = @character.utility_calc
    @character.face_score = @character.face_calc

    if @character.save
      # @character.score_calc
      render "show.json.jb"
    else
      render json: { message: "Character not saved" }
    end
  end

  def destroy
    character = Character.find_by(id: params[:id])
    character.destroy
    render json: { message: "Character failed death save." }
  end

  def add_spell
    @character = Character.find_by(id: params[:id])
    if @character.add_spell(params[:spell_id])
      @character.nuke_score = @character.nuke_calc
      @character.cc_score = @character.cc_calc
      @character.utility_score = @character.utility_calc
      @character.face_score = @character.face_calc
      render "show.json.jb"
    else
      render json: { message: "Spell not added" }
    end
  end

  def destroy_spell
    @character = Character.find_by(id: params[:id])
    if @character.destroy_spell(params[:spell_id])
      @character.nuke_score = @character.nuke_calc
      @character.cc_score = @character.cc_calc
      @character.utility_score = @character.utility_calc
      @character.face_score = @character.face_calc
      render "show.json.jb"
    else
      render json: { message: "Spell not destroyed!" }
    end
  end
end
