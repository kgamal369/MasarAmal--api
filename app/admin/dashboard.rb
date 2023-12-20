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
              li "Total Roles: #{Role.count}"
              li "Total Users: #{User.count}"
              li "Total Users_Rols: #{UserRole.count}"
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
              li link_to("Roles",admin_roles_path)
              li link_to("Users",admin_users_path)
              li link_to("Users_Roles",admin_user_roles_path)
            end
          end
        end
      end
      columns do
        column do
          panel "Facilities Distribution" do
            pie_chart Facility.group(:name).count
          end
        end

        column do
          panel "Doctors Distribution" do
            bar_chart Doctor.group(:name).count
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
