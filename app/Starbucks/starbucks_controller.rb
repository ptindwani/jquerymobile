require 'rho/rhocontroller'
require 'helpers/browser_helper'

class StarbucksController < Rho::RhoController
  include BrowserHelper

  # GET /Starbucks
  def index
    @starbuckses = Starbucks.find(:all)
    render
  end

  def client
    @attendees = Attendee.find(:all)
    render :action => :client
  end
  
  # GET /Starbucks/{1}
  def show
    @starbucks = Starbucks.find(@params['id'])
    if @starbucks
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Starbucks/new
  def new
    @starbucks = Starbucks.new
    render :action => :new
  end

  def choosedrink
    redirect :action => :drink
  end

  # GET /Starbucks/{1}/edit
  def edit
    @starbucks = Starbucks.find(@params['id'])
    if @starbucks
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Starbucks/create
  def create
    @starbucks = Starbucks.new(@params['starbucks'])
    @starbucks.save
    redirect :action => :index
  end

  # POST /Starbucks/{1}/update
  def update
    @starbucks = Starbucks.find(@params['id'])
    @starbucks.update_attributes(@params['starbucks']) if @starbucks
    redirect :action => :index
  end

  # POST /Starbucks/{1}/delete
  def delete
    @starbucks = Starbucks.find(@params['id'])
    @starbucks.destroy if @starbucks
    redirect :action => :index  
  end
end
