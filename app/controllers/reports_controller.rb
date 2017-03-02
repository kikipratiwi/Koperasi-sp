class ReportsController < ApplicationController
  before_action :authenticate_official!
  
  def member
    @members = Member.all
    respond_to do |format|
      format.pdf do
        render pdf: "member_report.pdf",
               template: 'reports/member.html.erb',
               locals: {members: @members},
               viewport_size: '1280x1024',
               margin: { top: 10, bottom: 5, left: 10, right: 10 },
               layout: 'pdf.html.erb',
               show_as_html: params[:as_html]
      end
      format.html
    end    
  end

  def deposit
    @deposits = Deposit.all
    respond_to do |format|
      format.pdf do
        render pdf: "deposit_report.pdf",
               template: 'reports/deposit.html.erb',
               locals: {members: @members},
               viewport_size: '1280x1024',
               margin: { top: 10, bottom: 5, left: 10, right: 10 },
               layout: 'pdf.html.erb',
               show_as_html: params[:as_html]
      end
      format.html
    end    
  end

  def member_card

    @member = Member.find(params[:member_id])    
    respond_to do |format|
      format.pdf do
        render pdf: "member_card.pdf",
               template: 'reports/member_card.html.erb',
               locals: {members: @members},
               viewport_size: '333x223',
               layout: 'pdf.html.erb',
               show_as_html: params[:as_html]
      end
      format.html
    end    
  end

  def official
    @officials = Official.all
    respond_to do |format|
      format.pdf do
        render pdf: "official_report.pdf",
               template: 'reports/official.html.erb',
               locals: {members: @officials},
               viewport_size: '1280x1024',
               margin: { top: 20, bottom: 0, left: 0, right: 0 },
               layout: 'pdf.html.erb',
               show_as_html: params[:as_html]
      end
      format.html
    end    
  end

end
