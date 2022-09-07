class RegistriesController < ApplicationController
  def new
    @registry = Registry.new
  end

  def create
    @registry = Registry.new(@registry_id)
    # raise
    @registry.save
    if @registry.save
      redirect_to root_path(@registry)
      raise
    else
      render :new, status: :unprocessable_entity
    end
  end
end
