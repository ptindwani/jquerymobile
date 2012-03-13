require 'rho/rhocontroller'
require 'helpers/browser_helper'

class AttendeeController < Rho::RhoController
  include BrowserHelper

  # GET /Attendee
  def index
    @attendees = Attendee.find(:all)
    render # :back => '/app'
  end

  # GET /Attendee/{1}
  def show
    @attendee = Attendee.find(@params['id'])
    puts "@attendee : #{@attendee}"
    if @attendee
      render :action => :show # , :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Attendee/new
  def new
    @attendee = Attendee.new
    render :action => :new
  end

  # GET /Attendee/{1}/edit
  def edit
    @attendee = Attendee.find(@params['id'])
    if @attendee
      render :action => :edit # , :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Attendee/create
  def create
    @attendee = Attendee.new(@params['attendee'])
    @attendee.save
    redirect :action => :index
  end

  # POST /Attendee/{1}/update
  def update
    @attendee = Attendee.find(@params['id'])
    @attendee.update_attributes(@params['attendee']) if @attendee
    redirect :action => :index
  end

  # POST /Attendee/{1}/delete
  def delete
    @attendee = Attendee.find(@params['id'])
    @attendee.destroy if @attendee
    redirect :action => :index  
  end
end
