# app/controllers/admin/cmses_controller.rb
module Admin
    class CmsesController < ApplicationController
      before_action :set_cms, only: %i[show edit update destroy]
  
      def index
        @cmses = Cms.all
      end
  
      def show; end
  
      def new
        @cms = Cms.new
      end
  
      def create
        @cms = Cms.new(cms_params)
  
        if @cms.save
          redirect_to admin_cms_path(@cms), notice: 'CMS was successfully created.'
        else
          render :new
        end
      end
  
      def edit; end
  
      def update
        if @cms.update(cms_params)
          redirect_to admin_cms_path(@cms), notice: 'CMS was successfully updated.'
        else
          render :edit
        end
      end
  
      def destroy
        @cms.destroy
        redirect_to admin_cmses_path, notice: 'CMS was successfully destroyed.'
      end
  
      private
  
      def set_cms
        @cms = Cms.find(params[:id])
      end
  
      def cms_params
        params.require(:cms).permit(:page_name, :language, :location, :type, :value, :last_modified_date)
      end
    end
  end
  