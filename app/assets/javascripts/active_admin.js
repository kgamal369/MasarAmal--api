// app/assets/javascripts/active_admin.js
function toggleCmsValueFields() {
  const componentSelect = document.getElementById('section_component_select');
  if (!componentSelect) return;

  const imageComponentIds = JSON.parse(componentSelect.dataset.imageComponentIds);
  const selectedComponentId = parseInt(componentSelect.value);
  const isImageComponent = imageComponentIds.includes(selectedComponentId);

  document.getElementById('value_input').style.display = isImageComponent ? 'none' : 'block';
  document.getElementById('image_input').style.display = isImageComponent ? 'block' : 'none';
}

document.addEventListener('DOMContentLoaded', function() {
  if (window.location.href.includes('/admin/cms_values')) {
    document.getElementById('section_component_select')?.addEventListener('change', toggleCmsValueFields);
    toggleCmsValueFields(); // Initial check on page load
  }
});
// document.addEventListener('DOMContentLoaded', function() {

//   const pageSelect = document.getElementById('cms_page_select');
//   const sectionSelect = document.getElementById('cms_section_select');
//   const componentSelect = document.getElementById('cms_component_select');
//   const imageInput = document.getElementById('image_input');
//   const valueInput = document.getElementById('value_input');
 
//     pageSelect.addEventListener('change', function() {
//       fetch(`/cms_values/dropdownlist_sections_for_page/${this.value}`)
//               .then(response => response.json())
//               .then(sections => {
//                 updateDropdown(sectionSelect, sections);
//                 sectionSelect.disabled = false;
//                 componentSelect.innerHTML = '';
//                 componentSelect.disabled = true;
//               });
//            });


//     sectionSelect.addEventListener('change', function() {
//       fetch(`/cms_values/dropdownlist_components_for_section/${this.value}`)
//               .then(response => response.json())
//               .then(components => {
//                 updateDropdown(componentSelect, components);
//                 componentSelect.disabled = false;
//               });   
//              });

//     componentSelect.addEventListener('change', function() {
//       fetch(`/cms_values/${this.value}/is_image_component`)
//         .then(response => response.json())
//         .then(data => {
//             if (data.is_image_component) {
//               imageInput.style.display = 'block';
//               valueInput.style.display = 'none';
//             } else {
//               imageInput.style.display = 'none';
//               valueInput.style.display = 'block';
//             }
//         })
//         .catch(error => console.error('Error:', error));
//     });
  
  


// setTimeout(setupEventListeners, 1000); 


//   function updateDropdown(dropdown, items) {
//     dropdown.innerHTML = '';
//     items.forEach(item => {
//       const option = new Option(item.name, item.id);
//       dropdown.appendChild(option);
//     });  
//   }
//   document.addEventListener('ajax:success', function(event) {
//     // Handle a successful AJAX form submission
//     const [data, status, xhr] = event.detail;
//     alert('Record created successfully');
//     // Optionally redirect or update the page as needed
//   });

//   document.addEventListener('ajax:error', function(event) {
//     // Handle an error in AJAX form submission
//     const [data, status, xhr] = event.detail;
//     alert('Failed to create new record: ' + data.errors.join(', '));
//   });


// });