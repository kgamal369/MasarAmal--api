// app/assets/javascripts/active_admin.js
document.addEventListener('DOMContentLoaded', function() {
  const pageSelect = document.getElementById('cms_page_select');
  const sectionSelect = document.getElementById('cms_section_select');
  const componentSelect = document.getElementById('cms_component_select');
  const filterSelect = document.getElementById('filter_select_id'); // Replace with your filter select ID
  const filterButton = document.querySelector('button[type="submit"]');
  const form = document.getElementById('cms_value_form'); // Replace with your form ID

  pageSelect.addEventListener('change', function() {
    fetch(`/admin/sections_for_page/${this.value}`)
      .then(response => response.json())
      .then(sections => {
        updateDropdown(sectionSelect, sections);
        sectionSelect.disabled = false;
        componentSelect.innerHTML = ''; // Reset component dropdown
        componentSelect.disabled = true;
      });
  });

  sectionSelect.addEventListener('change', function() {
    fetch(`/admin/components_for_section/${this.value}`)
      .then(response => response.json())
      .then(components => {
        updateDropdown(componentSelect, components);
        componentSelect.disabled = false;
      });
  });

  function updateDropdown(dropdown, items) {
    dropdown.innerHTML = '';
    items.forEach(item => {
      const option = new Option(item.name, item.id);
      dropdown.appendChild(option);
    });
  }

  filterSelect.addEventListener('change', function() {
    const pagesectionid = this.value;

    fetch(`/admin/cms_values/filter?pagesectionid=${pagesectionid}`)
      .then(response => response.json())
      .then(data => {
        if (data.component_name) {
          form.querySelector('#component_name_label').textContent = data.component_name;
          form.querySelector('#cms_value_input').value = data.value;
        }
      })
      .catch(error => console.error('Error:', error));
  });

  filterButton.addEventListener('click', function(event) {
    event.preventDefault();
    const languageId = document.querySelector('#q_languageid_eq').value;
    const pageSectionId = document.querySelector('#q_pagesectionid_eq').value;

    if (languageId && pageSectionId) {
      fetch(`/admin/cms_values/filter?languageid=${languageId}&pagesectionid=${pageSectionId}`)
        .then(response => response.json())
        .then(data => {
          const dynamicDiv = document.getElementById('dynamic_cms_values');
          dynamicDiv.innerHTML = ''; // Clear existing content

          data.forEach(({ component_name, value, cms_value_id }) => {
            dynamicDiv.innerHTML += `
              <div class="cms-value-entry">
                <label>${component_name}</label>
                <input type="text" value="${value}" id="value_${cms_value_id}">
                <button onclick="saveCmsValue(${cms_value_id}, document.getElementById('value_${cms_value_id}').value)">Save</button>
              </div>
            `;
          });
        })
        .catch(error => console.error('Error:', error));
    }
  });

  window.saveCmsValue = function(cmsValueId, newValue) {
    // Implement AJAX request to save the new value
    console.log(`Saving new value for CMS Value ID ${cmsValueId}: ${newValue}`);
    // Add logic to send a request to your server to update the value
  };
});
