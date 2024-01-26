// app/assets/javascripts/active_admin.js
document.addEventListener('DOMContentLoaded', function() {

  const pageSelect = document.getElementById('cms_page_select');
  const sectionSelect = document.getElementById('cms_section_select');
  const componentSelect = document.getElementById('cms_component_select');
  const imageInput = document.getElementById('image_input');
  const valueInput = document.getElementById('value_input');
 
    pageSelect.addEventListener('change', function() {
      fetch(`/cms_values/dropdownlist_sections_for_page/${this.value}`)
              .then(response => response.json())
              .then(sections => {
                updateDropdown(sectionSelect, sections);
                sectionSelect.disabled = false;
                componentSelect.innerHTML = '';
                componentSelect.disabled = true;
              });
           });


    sectionSelect.addEventListener('change', function() {
      fetch(`/cms_values/dropdownlist_components_for_section/${this.value}`)
              .then(response => response.json())
              .then(components => {
                updateDropdown(componentSelect, components);
                componentSelect.disabled = false;
              });   
             });

    componentSelect.addEventListener('change', function() {
      fetch(`/cms_values/${this.value}/is_image_component`)
        .then(response => response.json())
        .then(data => {
            if (data.is_image_component) {
              imageInput.style.display = 'block';
              valueInput.style.display = 'none';
            } else {
              imageInput.style.display = 'none';
              valueInput.style.display = 'block';
            }
        })
        .catch(error => console.error('Error:', error));
    });
  
  


setTimeout(setupEventListeners, 1000); 


  function updateDropdown(dropdown, items) {
    dropdown.innerHTML = '';
    items.forEach(item => {
      const option = new Option(item.name, item.id);
      dropdown.appendChild(option);
    });  
  }
  window.saveCmsValue = function(cmsValueId, newValue) {
    // Implement AJAX request to save the new value
    console.log(`Saving new value for CMS Value ID ${cmsValueId}: ${newValue}`);
    // Add logic to send a request to your server to update the value
  };
});