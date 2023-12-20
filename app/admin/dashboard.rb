# app/admin/dashboard.rb
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      columns do
        column do
          panel "Statistics" do
            ul do
              li "Total Facilities: #{Facility.count}"
              li "Total Doctors: #{Doctor.count}"
              li "Total Treatment Approaches: #{TreatmentApproach.count}"
              li "Total Mental Services: #{MentalService.count}"
              li "Total Blog Posts: #{BlogPost.count}"
              li "Total News Events: #{NewsEvent.count}"
            end
          end
        end

        column do
          panel "Quick Links" do
            ul do
              li link_to("Facilities", admin_facilities_path)
              li link_to("Doctors", admin_doctors_path)
              li link_to("Treatment Approaches", admin_treatment_approaches_path)
              li link_to("Mental Services", admin_mental_services_path)
              li link_to("Blog Posts", admin_blog_posts_path)
              li link_to("News Events", admin_news_events_path)
            end
          end
        end
      end

      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
  end
end
