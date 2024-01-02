# app/admin/dashboard.rb
ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      columns do
        column do
          panel 'Statistics' do
            ul do
              li "Total Facilities: #{Facility.count}"
              li "Total Doctors: #{Doctor.count}"
              li "Total Treatment Approaches: #{TreatmentApproach.count}"
              li "Total Mental Services: #{MentalService.count}"
              li "Total Blog Posts: #{BlogPost.count}"
              li "Total News Events: #{NewsEvent.count}"
              li "Total Roles: #{Role.count}"
              li "Total Users: #{User.count}"
              li "Total Users_Roles: #{UserRole.count}"
              li "CMS Pages: #{CmsPage.count}"
              li "CMS Sections: #{CmsSection.count}"
              li "CMS Components: #{CmsComponent.count}"
              li "CMS Languages: #{CmsLanguage.count}"
              li "CMS Page Sections: #{CmsPageSection.count}"
              li "CMS Section Components: #{CmsSectionComponent.count}"
              li "CMS Values: #{CmsValue.count}"
            end
          end
        end

        column do
          panel 'Quick Links' do
            ul do
              li link_to('Facilities', admin_facilities_path)
              li link_to('Doctors', admin_doctors_path)
              li link_to('Treatment Approaches', admin_treatment_approaches_path)
              li link_to('Mental Services', admin_mental_services_path)
              li link_to('Blog Posts', admin_blog_posts_path)
              li link_to('News Events', admin_news_events_path)
              li link_to('Roles', admin_roles_path)
              li link_to('Users', admin_users_path)
              li link_to('Users_Roles', admin_user_roles_path)
              li link_to('CMS Pages', admin_cms_pages_path)
              li link_to('CMS Sections', admin_cms_sections_path)
              li link_to('CMS Components', admin_cms_components_path)
              li link_to('CMS Languages', admin_cms_languages_path)
              li link_to('CMS Page Sections', admin_cms_page_sections_path)
              li link_to('CMS Section Components', admin_cms_section_components_path)
              li link_to('CMS Values', admin_cms_values_path)
            end
          end
        end
      end
      columns do
        column do
          panel 'Facilities Distribution' do
            pie_chart Facility.group(:name).count
          end
        end

        column do
          panel 'Amount' do
            data = {
              'Total Doctors' => Doctor.count,
              'Total Facilities' => Facility.count,
              'Total Treatment Approaches' => TreatmentApproach.count,
              'Total Mental Services' => MentalService.count,
              'Total Blog Posts' => BlogPost.count,
              'Total News Events' => NewsEvent.count,
              'Total Roles' => Role.count,
              'Total Users' => User.count,
              'Total Users_Rols' => UserRole.count
            }

            bar_chart data
          end
        end
      end
      span class: 'blank_slate' do
        span I18n.t('active_admin.dashboard_welcome.welcome')
        small I18n.t('active_admin.dashboard_welcome.call_to_action')
      end
    end
  end
end
