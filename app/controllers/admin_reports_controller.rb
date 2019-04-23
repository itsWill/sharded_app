class AdminReportsController < ApplicationController
  before_action :set_admin_report, only: [:show, :edit, :update, :destroy]

  # GET /admin_reports
  # GET /admin_reports.json
  def index
    @admin_reports = AdminReport.all
  end

  # GET /admin_reports/1
  # GET /admin_reports/1.json
  def show
  end

  # GET /admin_reports/new
  def new
    @admin_report = AdminReport.new
  end

  # GET /admin_reports/1/edit
  def edit
  end

  # POST /admin_reports
  # POST /admin_reports.json
  def create
    @admin_report = AdminReport.new(admin_report_params)

    respond_to do |format|
      if @admin_report.save
        format.html { redirect_to @admin_report, notice: 'Admin report was successfully created.' }
        format.json { render :show, status: :created, location: @admin_report }
      else
        format.html { render :new }
        format.json { render json: @admin_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_reports/1
  # PATCH/PUT /admin_reports/1.json
  def update
    respond_to do |format|
      if @admin_report.update(admin_report_params)
        format.html { redirect_to @admin_report, notice: 'Admin report was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_report }
      else
        format.html { render :edit }
        format.json { render json: @admin_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_reports/1
  # DELETE /admin_reports/1.json
  def destroy
    @admin_report.destroy
    respond_to do |format|
      format.html { redirect_to admin_reports_url, notice: 'Admin report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_report
      @admin_report = AdminReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_report_params
      params.fetch(:admin_report, {})
    end
end
