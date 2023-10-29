let map;
let marker;
let geocoder;
let responseDiv;
let response;

function initMap() {

  //initializes map centers it in athens 
  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 12,
    center: { lat: 37.98919295941604, lng: 23.73868050773013 },
    mapTypeControl: false,
  });
  //google maps geocoder
  geocoder = new google.maps.Geocoder();

  const inputText = document.createElement("input");

  inputText.type = "text";
  //inputText.placeholder = "Εισάγετε περιοχή";

  const submitButton = document.createElement("input");

  submitButton.type = "button";
  submitButton.value = "Find Me";
  submitButton.classList.add("button", "button-primary");

  const clearButton = document.createElement("input");

  clearButton.type = "button";
  clearButton.value = "Clear";
  clearButton.classList.add("button", "button-secondary");

  response = document.createElement("pre");
  response.id = "response";
  response.innerText = "";
  responseDiv = document.createElement("div");
  responseDiv.id = "response-container";
  responseDiv.appendChild(response);

  //const instructionsElement = document.createElement("p");

  //instructionsElement.id = "instructions";
  //instructionsElement.innerHTML =
    //"<strong>Instructions</strong>: Enter an address in the textbox to geocode or click on the map to reverse geocode.";

  //WHERE THE BUTTONS GO
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(inputText);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(submitButton);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(clearButton);
  //map.controls[google.maps.ControlPosition.LEFT_TOP].push(instructionsElement);
  map.controls[google.maps.ControlPosition.LEFT_TOP].push(responseDiv);

  marker = new google.maps.Marker({
    map,
  });
  map.addListener("click", (e) => {
    geocode({ location: e.latLng });
  });
  submitButton.addEventListener("click", () =>
    geocode({ address: inputText.value })
  );
  clearButton.addEventListener("click", () => {
    clear();
  });
  clear();
}

function clear() {
  marker.setMap(null);
  responseDiv.style.display = "none";
}

function geocode(request) {
  clear();
  geocoder
    .geocode(request)
    .then((result) => {
      const { results } = result;
      console.log(result);
      
      //full emergency address
      var emergencyAddress = result.results[0].formatted_address;
      console.log(emergencyAddress);
      
      //finds the emergency zip_code
      var addressComponents = result.results[0].address_components;
      var emergencyZip = null;
        for(var i=0; i<addressComponents.length; i++){
          if (addressComponents[i].types[0]=='postal_code'){
            emergencyZip = addressComponents[i].long_name;
          }
        }
      console.log(emergencyZip);

      //output to page
      document.getElementById('emergency-address').innerHTML = emergencyAddress;
      document.getElementById('emergency-address').value = emergencyAddress;
      document.getElementById('address-output').innerHTML = emergencyAddress;
      document.getElementById('emergency-zip').innerHTML = emergencyZip;
      document.getElementById('emergency-zip').value = emergencyZip;

      //shows location on the map
      map.setCenter(results[0].geometry.location);
      map.setZoom(15);
      marker.setPosition(results[0].geometry.location);
      marker.setMap(map);
      
      return results;
    })
    .catch((e) => {
      alert("Geocode was not successful for the following reason: " + e);
    });
}
