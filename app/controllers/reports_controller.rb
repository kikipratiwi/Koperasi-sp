class ReportsController < ApplicationController

  def member
    @members = Member.all
    respond_to do |format|
      format.pdf do
        render pdf: "members",
               template: "reports/member.pdf.erb",
               locals: {members: @members},
               viewport_size: '1280x1024',
               margin: { top: 20, bottom: 0, left: 0, right: 0 },
               layout: 'pdf.html',
               show_as_html: params[:as_html]
      end
    end    
  end

  def download_report
  end

end
