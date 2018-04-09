class GameConfigurationsController < ApplicationController
  before_action :set_game_configuration, only: %i[show update destroy]

  # GET /game_configurations
  def index
    @game_configurations = GameConfiguration.all
    json_response(@game_configurations)
  end

  # GET /game_configurations/1
  def show
    json_response(@game_configuration)
  end

  # POST /game_configurations
  def create
    @game_configuration = GameConfiguration.new(game_configuration_params)
    if @game_configuration.save
      json_response(@game_configuration, :created, location: @game_configuration)
    else
      json_response(@game_configuration.errors, :unprocessable_entity)
    end
  end

  # PATCH/PUT /game_configurations/1
  def update
    if @game_configuration.update(game_configuration_params)
      json_response(@game_configurations)
      head :no_content, status: :ok
    else
      json_response(@game_configuration.errors, :unprocessable_entity)
    end
  end

  # DELETE /game_configurations/1
  def destroy
    if @game_configuration.destroy
      head :no_content, status: :ok
    else
      json_response(@game_configuration.errors, :unprocessable_entity)
    end
  end

  private

  def set_game_configuration
    @game_configuration = GameConfiguration.find(params[:id])
  end

  def game_configuration_params
    params.require(:game_configuration).permit(:user_id, :game, :settings)
  end
end
