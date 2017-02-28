class ReportsController < ApplicationController

  def member
    @members = Member.all
    respond_to do |format|
      format.pdf do
        render pdf: "member_report.pdf",
               template: 'reports/member.html.erb',
               locals: {members: @members},
               viewport_size: '1280x1024',
               margin: { top: 20, bottom: 0, left: 0, right: 0 },
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
