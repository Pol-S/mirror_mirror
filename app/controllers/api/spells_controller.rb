class Api::SpellsController < ApplicationController
  def index
    @spells = Spell.all
    render "index.json.jb"
  end
end
