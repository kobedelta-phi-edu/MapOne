mapboxgl.accessToken = '#';
      
// Initialize the map
var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/dark-v10',
    // style: 'mapbox://styles/mapbox/light-v10',
    center: [120.256, 17.193], // Region 1 center point
    zoom: 7.5 // Zoom to Region 1 level
});

// Add the geocoder search bar
var geocoder = new MapboxGeocoder({
    accessToken: mapboxgl.accessToken,
    mapboxgl: mapboxgl,
    countries: 'PH',
    placeholder: 'Search for a place...',
    zoom: 10
});

document.getElementById('geocoder').appendChild(geocoder.onAdd(map));

// Wait for the map to load
map.on('load', function () {
    var provinces = [
        {
            name: "Ilocos Norte",
            fillColor: '#ef8a62',
            coordinates: [120.5935433,18.1973235],
            provJson: 'json/boundary/ilocos norte-boundary.json',
            muniJson: 'json/prov-municipalities/ilocos norte-municipalities.json'
        },
        {
            name: "Ilocos Sur",
            fillColor: '#998ec3',
            coordinates: [120.3872632,17.5755487],
            provJson: 'json/boundary/ilocos sur-boundary.json',
            muniJson: 'json/prov-municipalities/ilocos sur-municipalities.json'
        },
        {
            name: "La Union",
            fillColor: '#f1a340',
            coordinates: [120.317104,16.6162676],
            provJson: 'json/boundary/la union-boundary.json',
            muniJson: 'json/prov-municipalities/la union-municipalities.json'
        },
        {
            name: "Pangasinan",
            fillColor: '#67a9cf',
            coordinates: [120.2307093,16.0206363],
            provJson: 'json/boundary/pangasinan-boundary.json',
            muniJson: 'json/prov-municipalities/pangasinan-municipalities.json'
        }
    ];
            
    var selectedProvince = null;
    geocoder.on('result', function (e) {
        var result = e.result;  // Get the selected search result
        // Check if the result has a province property
        if (result.context && result.context.length > 0) {
            var provinceName = result.context.find(function (context) {
                return context.id.startsWith('region');
            }).text;
            
            // Loop through the provinces and find the matching province
            provinces.forEach(function (province) {
                if (province.name.toLowerCase() === provinceName.toLowerCase()) {
                    // Hide the previously clicked layer if it exists
                    if (previousProvince !== null) {
                        showFillLayerHideLabel(previousProvince);
                    }
                    hideCurrFillShowLabel(province.name);
                    previousProvince = province.name;
                    selectedProvince = province; // Set the selected province
                    handleMunicipalityLabel(province);
                    
                    fetch('json/province/' + province.name + '-info.json')
                        .then(response => response.json())
                        .then(data => {
                        var coordinates = data.geometry.coordinates.slice();
                        var provinceName = data.properties.PROVINCE;
                        var displayImage = data.properties.IMAGE;
                        var provinceRegion = data.properties.REGION;
                        var provinceDescription = data.properties.DESCRIPTION;
    
                        if (selectedProvince !== null) {
                            showFillLayerHideLabel(selectedProvince);
                            selectedProvince = null;  // Reset the selected province
                            // zoomCenterCoordinates(coordinates);
                        }
    
                        // Show the sidebar
                        var sidebarContainer = document.getElementById('sidebar');
                        sidebarContainer.style.display = 'block';
    
                        // Set the sidebar content
                        document.getElementById('sidebar-image').src = displayImage;
                        document.getElementById('sidebar-province').textContent = provinceName;
                        document.getElementById('sidebar-region').textContent = provinceRegion;
                        document.getElementById('sidebar-description').textContent = provinceDescription;
                                    
                        // Add the close event for the sidebar
                        document.getElementById('sidebar-close').addEventListener('click', function () {
                            sidebarContainer.style.display = 'none';
                            showFillLayerHideLabel(provinceName);
                            selectedProvince = null; // Reset the selected province
                            zoomCenterMap();
                        });
    
                        document.getElementById("lang-button").addEventListener('click', function(){
                            // check if the new container has already been created
                            var newContainer = document.querySelector(".new-container");
                            if (!newContainer) {
                                // create new container if it doesn't exist
                                newContainer = document.createElement("div");
                                newContainer.classList.add("new-container");
    
                                // Get the clicked province name
                                var clickedProvinceName = document.getElementById('sidebar-province').textContent;
                                console.log(clickedProvinceName);
                                // Fetch the province info JSON file based on the clicked province
                                fetch('json/province/' + clickedProvinceName + '-info.json')
                                    .then(response => response.json())
                                    .then(data => {
                                        var provinceName = document.createElement('h2');
                                        provinceName.textContent = data.properties.PROVINCE;
                                        provinceName.classList.add('new-province-name');
                                        
                                        var provinceImage = document.createElement('img');
                                        provinceImage.src = data.properties.IMAGE;
                                        provinceImage.alt = data.properties.PROVINCE;
                                        provinceImage.classList.add('new-province-image'); 
                                        
                                        var provinceRegion = document.createElement('p');
                                        provinceRegion.textContent = data.properties.REGION;
                                        provinceRegion.classList.add('new-province-region');
                                        
                                        // create description button
                                        var descButton = document.createElement('button');
                                        descButton.classList.add('new-desc-button');
                                        descButton.textContent = 'Description';
                                        descButton.addEventListener('click', function() {
                                            newContainer.remove();
                                            document.getElementById("sidebar").style.display = "block";
                                        });
    
                                        // create languages button
                                        var langButton = document.createElement('button');
                                        langButton.classList.add('new-lang-button');
                                        langButton.textContent = 'Languages';
    
                                        // create back button
                                        var closeButton = document.createElement("button");
                                        closeButton.classList.add("close-icon");
                                        var closeButtonImg = document.createElement("img");
                                        newContainer.appendChild(closeButton);
    
                                        closeButton.addEventListener('click', function(){
                                            // remove new container and restore previous container
                                            newContainer.remove();
                                            document.getElementById("sidebar").style.display = "none";
                                            showFillLayerHideLabel(clickedProvinceName);
                                            zoomCenterMap();
                                        });
    
                                        // create HTML elements to display the data
                                        var languageList = document.createElement('ul');
    
                                        // loop through each language and create list items with descriptions
                                        data.properties.LANGUAGES.forEach(language => {
                                            var languageItem = document.createElement('li');
                                            var languageButton = document.createElement('button'); 
                                            languageButton.textContent = language.name;
                                            languageButton.classList.add('new-langList-button');
    
                                            var langdesc = document.createElement('p');
                                            langdesc.textContent = language.desc;
                                            langdesc.classList.add('lang-desc');
    
                                            languageList.classList.add('lang-list');
                                            languageItem.classList.add('lang-item');
    
                                            // make the language button clickable
                                            languageButton.addEventListener('click', function() {
                                                while (newContainer.firstChild) {
                                                    newContainer.removeChild(newContainer.firstChild);
                                                }
    
                                                // create back button
                                                var backButton = document.createElement("button");
                                                backButton.classList.add("back-button");
                                                var backButtonImg = document.createElement("img");
                                                newContainer.appendChild(backButton);
    
                                                backButton.addEventListener('click', function(){
                                                    // remove new container and restore previous container
                                                    newContainer.remove();
                                                    document.getElementById("sidebar").style.display = "block";
                                                });
    
                                                // Find the clicked language object in the data
                                                var clickedLanguage = data.properties.LANGUAGES.find(language => language.name === languageButton.textContent);
    
                                                // Create a table to display phrases and translations
                                                var languageTable = document.createElement('table');
                                                languageTable.classList.add('lang-table');
    
                                                // Create table header
                                                var tableHeaderRow = document.createElement('tr');
                                                var phraseHeader = document.createElement('th');
                                                phraseHeader.textContent = 'Phrases';
    
                                                var langHeader = document.createElement('p');
                                                langHeader.classList.add('lang-header')
                                                langHeader.textContent = language.name;
    
                                                var translationHeader = document.createElement('th');
                                                translationHeader.textContent = 'Translation';
    
                                                tableHeaderRow.appendChild(phraseHeader);
                                                tableHeaderRow.appendChild(translationHeader);
                                                tableHeaderRow.appendChild(langHeader)
                                                languageTable.appendChild(tableHeaderRow);
    
                                                // Loop through phrases and translations of the clicked language
                                                clickedLanguage.phrases.forEach((phrase, index) => {
                                                    var languageRow = document.createElement('tr');
                                                    var phraseCell = document.createElement('td');
                                                    var translationCell = document.createElement('td');
    
                                                    phraseCell.textContent = phrase;
                                                    phraseCell.classList.add("phrase-style");
                                                    translationCell.textContent = clickedLanguage.translation[index];
                                                    translationCell.classList.add('translation-style');
                                                    
                                                    languageRow.appendChild(phraseCell);
                                                    languageRow.appendChild(translationCell);
                                                    languageTable.appendChild(languageRow);
                                                });
    
                                                newContainer.appendChild(backButton);
                                                newContainer.appendChild(languageTable);
                                            });
    
                                            languageItem.appendChild(languageButton);
                                            languageItem.appendChild(langdesc);
                                            languageList.appendChild(languageItem);
                                        });
    
                                        newContainer.appendChild(closeButton);
                                        newContainer.appendChild(languageList);
                                        newContainer.appendChild(provinceName);
                                        newContainer.appendChild(provinceImage);
                                        newContainer.appendChild(provinceRegion);
                                        newContainer.appendChild(descButton);
                                        newContainer.appendChild(langButton);
                                        document.body.appendChild(newContainer);
                                    });
    
    
                                // add new container to the body
                                document.body.appendChild(newContainer);
                            }
    
                            map.on('click','province-labels',function () {
                                newContainer.remove();
                                document.getElementById("sidebar").style.display = "block";
                            });
    
                            hideSideBar()
                        }); 
                    });
                }
            });
        }
    });
    
    // Add a clear event listener to the geocoder search input
    geocoder.on('clear', function () {
        // Check if there is a selected province
        if (selectedProvince !== null) {
            showFillLayerHideLabel(selectedProvince.name);
            selectedProvince = null; // Reset the selected province
            // Zoom back to the map center coordinates
            zoomCenterMap();
            hideSideBar();
        }
        hideSideBar()
    });
    
    const logo = document.getElementById('logo-name');
    logo.addEventListener('click', function() {
        location.reload();
    });
    
    // Define a variable to keep track of the currently clicked layer ID
    var previousProvince = null;
    // Loop over each province and add a click event
    provinces.forEach(function (province) {
        // Add the boundary layers of each provinces in Region 1
        handleProvinceFillLayer(province);

        // Add the click event for the places
        map.on('click', 'province-labels', function (e) {
            var coordinates = e.features[0].geometry.coordinates.slice();
            var provinceName = e.features[0].properties.PROVINCE;
            var displayImage = e.features[0].properties.IMAGE;
            var provinceRegion = e.features[0].properties.REGION;
            var provinceDescription = e.features[0].properties.DESCRIPTION;

            if (selectedProvince !== null) {
                showFillLayerHideLabel(selectedProvince);
                selectedProvince = null;  // Reset the selected province
                zoomCenterCoordinates(coordinates);
            }

            // Show the sidebar
            var sidebarContainer = document.getElementById('sidebar');
            sidebarContainer.style.display = 'block';

            // Set the sidebar content
            document.getElementById('sidebar-image').src = displayImage;
            document.getElementById('sidebar-province').textContent = provinceName;
            document.getElementById('sidebar-region').textContent = provinceRegion;
            document.getElementById('sidebar-description').textContent = provinceDescription;
                        
            // Add the close event for the sidebar
            document.getElementById('sidebar-close').addEventListener('click', function () {
                sidebarContainer.style.display = 'none';
                showFillLayerHideLabel(provinceName);
                selectedProvince = null; // Reset the selected province
                zoomCenterMap();
            });

            document.getElementById("lang-button").addEventListener('click', function(){
                // check if the new container has already been created
                var newContainer = document.querySelector(".new-container");
                if (!newContainer) {
                    // create new container if it doesn't exist
                    newContainer = document.createElement("div");
                    newContainer.classList.add("new-container");

                    // Get the clicked province name
                    var clickedProvinceName = document.getElementById('sidebar-province').textContent;
                    console.log(clickedProvinceName);
                    // Fetch the province info JSON file based on the clicked province
                    fetch('json/province/' + clickedProvinceName + '-info.json')
                        .then(response => response.json())
                        .then(data => {
                            var provinceName = document.createElement('h2');
                            provinceName.textContent = data.properties.PROVINCE;
                            provinceName.classList.add('new-province-name');
                            
                            var provinceImage = document.createElement('img');
                            provinceImage.src = data.properties.IMAGE;
                            provinceImage.alt = data.properties.PROVINCE;
                            provinceImage.classList.add('new-province-image'); 
                            
                            var provinceRegion = document.createElement('p');
                            provinceRegion.textContent = data.properties.REGION;
                            provinceRegion.classList.add('new-province-region');
                            
                            // create description button
                            var descButton = document.createElement('button');
                            descButton.classList.add('new-desc-button');
                            descButton.textContent = 'Description';
                            descButton.addEventListener('click', function() {
                                newContainer.remove();
                                document.getElementById("sidebar").style.display = "block";
                            });

                            // create languages button
                            var langButton = document.createElement('button');
                            langButton.classList.add('new-lang-button');
                            langButton.textContent = 'Languages';

                            // create back button
                            var closeButton = document.createElement("button");
                            closeButton.classList.add("close-icon");
                            var closeButtonImg = document.createElement("img");
                            newContainer.appendChild(closeButton);

                            closeButton.addEventListener('click', function(){
                                // remove new container and restore previous container
                                newContainer.remove();
                                document.getElementById("sidebar").style.display = "none";
                                showFillLayerHideLabel(clickedProvinceName);
                                zoomCenterMap();
                            });

                            // create HTML elements to display the data
                            var languageList = document.createElement('ul');

                            // loop through each language and create list items with descriptions
                            data.properties.LANGUAGES.forEach(language => {
                                var languageItem = document.createElement('li');
                                var languageButton = document.createElement('button'); 
                                languageButton.textContent = language.name;
                                languageButton.classList.add('new-langList-button');

                                var langdesc = document.createElement('p');
                                langdesc.textContent = language.desc;
                                langdesc.classList.add('lang-desc');

                                languageList.classList.add('lang-list');
                                languageItem.classList.add('lang-item');

                                // make the language button clickable
                                languageButton.addEventListener('click', function() {
                                    while (newContainer.firstChild) {
                                        newContainer.removeChild(newContainer.firstChild);
                                    }

                                     // create back button
                                    var backButton = document.createElement("button");
                                    backButton.classList.add("back-button");
                                    var backButtonImg = document.createElement("img");
                                    newContainer.appendChild(backButton);

                                    backButton.addEventListener('click', function(){
                                        // remove new container and restore previous container
                                        newContainer.remove();
                                        document.getElementById("sidebar").style.display = "block";
                                    });

                                    // Find the clicked language object in the data
                                    var clickedLanguage = data.properties.LANGUAGES.find(language => language.name === languageButton.textContent);

                                    // Create a table to display phrases and translations
                                    var languageTable = document.createElement('table');
                                    languageTable.classList.add('lang-table');

                                    // Create table header
                                    var tableHeaderRow = document.createElement('tr');
                                    var phraseHeader = document.createElement('th');
                                    phraseHeader.textContent = 'Phrases';

                                    var langHeader = document.createElement('p');
                                    langHeader.classList.add('lang-header')
                                    langHeader.textContent = language.name;

                                    var translationHeader = document.createElement('th');
                                    translationHeader.textContent = 'Translation';

                                    tableHeaderRow.appendChild(phraseHeader);
                                    tableHeaderRow.appendChild(translationHeader);
                                    tableHeaderRow.appendChild(langHeader)
                                    languageTable.appendChild(tableHeaderRow);

                                    // Loop through phrases and translations of the clicked language
                                    clickedLanguage.phrases.forEach((phrase, index) => {
                                        var languageRow = document.createElement('tr');
                                        var phraseCell = document.createElement('td');
                                        var translationCell = document.createElement('td');

                                        phraseCell.textContent = phrase;
                                        phraseCell.classList.add("phrase-style");
                                        translationCell.textContent = clickedLanguage.translation[index];
                                        translationCell.classList.add('translation-style');
                                        
                                        languageRow.appendChild(phraseCell);
                                        languageRow.appendChild(translationCell);
                                        languageTable.appendChild(languageRow);
                                    });

                                    newContainer.appendChild(backButton);
                                    newContainer.appendChild(languageTable);
                                });

                                languageItem.appendChild(languageButton);
                                languageItem.appendChild(langdesc);
                                languageList.appendChild(languageItem);
                            });

                            newContainer.appendChild(closeButton);
                            newContainer.appendChild(languageList);
                            newContainer.appendChild(provinceName);
                            newContainer.appendChild(provinceImage);
                            newContainer.appendChild(provinceRegion);
                            newContainer.appendChild(descButton);
                            newContainer.appendChild(langButton);
                            document.body.appendChild(newContainer);
                        });


                    // add new container to the body
                    document.body.appendChild(newContainer);
                }

                map.on('click','province-labels',function () {
                    newContainer.remove();
                    document.getElementById("sidebar").style.display = "block";
                });

                hideSideBar()
            }); 
        });

        // Add click event listener to the map
        map.on('click', function (e) { 
            // Get a list of all the features that were clicked on
            var features = map.queryRenderedFeatures(e.point);
            // Loop through the clicked features and check if any of them match the ID of the fill boundary layer you want to target
            features.forEach(function (feature) {
                if (feature.layer.id === province.name + '-fill-boundary') {
                    // Hide the previously clicked layer if it exists
                    if (previousProvince !== null) {
                        showFillLayerHideLabel(previousProvince);
                        hideSideBar();
                    }
                    hideCurrFillShowLabel(province.name);
                    zoomCenterCoordinates(province);

                    // Set the current province as the previously clicked province
                    previousProvince = province.name;
                    handleMunicipalityLabel(province);
                }
                        
                // Add the click event for the municipalities
                map.on('click', province.name +'-municipality-labels', function (e) {
                    var coordinates = e.features[0].geometry.coordinates.slice();
                    var municipalityName = e.features[0].properties.MUNICIPALITY;
                    var postalCode = e.features[0].properties.POSTAL_CODE;
                    var placeDescription = e.features[0].properties.DESCRIPTION;
                    var placeLanguages = e.features[0].properties.LANGUAGES;

                    var languagesHTML = '';
                    if (placeLanguages) {
                        // Split the languages by comma
                        var languages = placeLanguages.split(',');
                        languages.forEach(function (language) {
                            // Trim leading/trailing spaces from each language
                            language = language.trim().replace(/["\[\]]/g, '');
                            // Create a clickable link for each language
                            languagesHTML += '<li>' + language + '</li>';
                        });
                    }
                
                    new mapboxgl.Popup()
                        .setLngLat(coordinates)
                        .setHTML('<div class="place-name">' + municipalityName + '</div>' + 
                        '<div class="place-postal">' + postalCode + '</div>' + '</div>' + 
                        '<div class="place-description">' + placeDescription + '</div>' + 
                        '<div class="place-languages">Languages:' + languagesHTML + '</div>')
                        .addTo(map)
                        .on('close', function(){
                            //close
                            geocoder.clear();
                    });
                    popup.close();
                });
            });

            // Check if any feature matches the fill boundary layer ID
            var isFillLayerClicked = features.some(function (feature) {
                return feature.layer.id === province.name + '-fill-boundary';
            });
            // Check if any clickable element (municipality labels) was clicked
            var isClickableElementClicked = features.some(function (feature) {
                return feature.layer.id === province.name + '-municipality-labels';
            });
            if (!isFillLayerClicked && !isClickableElementClicked) {
                showFillLayerHideLabel(province.name);
            }
        });
                
        // Change the cursor to a pointer when hovering over the municipalities layer
        map.on('mouseenter', province.name +'-municipality-labels', function () {
            map.getCanvas().style.cursor = 'pointer';
        });
        // Change the cursor back to a default when leaving the places layer
        map.on('mouseleave', province.name +'-municipality-labels', function () {
            map.getCanvas().style.cursor = '';
        });
    }); 

    //Province label layer
    handleProvinceLabel();

    // Change the cursor to a pointer when hovering over the places layer
    map.on('mouseenter', 'province-labels', function () {
        map.getCanvas().style.cursor = 'pointer';
    });
    // Change the cursor back to a default when leaving the places layer
    map.on('mouseleave', 'province-labels', function () {
        map.getCanvas().style.cursor = '';
    });
});

function showFillLayerHideLabel(e){
    map.setLayoutProperty(e + '-fill-boundary', 'visibility', 'visible');
    map.setLayoutProperty(e + '-municipality-labels', 'visibility', 'none');
}

function hideCurrFillShowLabel(e){
    // Hide the current fill boundary layer
    map.setLayoutProperty(e + '-fill-boundary', 'visibility', 'none');
    // Show the layer you want to display
    map.setLayoutProperty(e + '-municipality-labels', 'visibility', 'visible');
}

function zoomCenterCoordinates(e){
    // Zoom in to the center of coordinates
    map.flyTo({
        center: e.coordinates,
        zoom: 9
    });
}

function zoomCenterMap(){
    map.flyTo({
        center: [120.256, 17.193],
        zoom: 7.5
    });
}

function hideSideBar(){
    // hide sidebar container
    return document.getElementById("sidebar").style.display = "none";
}

function handleMunicipalityLabel(e){
    map.addLayer({
        id: e.name + '-municipality-labels',
        type: 'symbol',
        source: {
            type: 'geojson',
            data: e.muniJson
        },
        layout: {
            'text-field': ['get', 'MUNICIPALITY'],
            'text-font': [
            'DIN Offc Pro Medium',
            'Arial Unicode MS Regular'],
            'text-size': 17
        },
        paint: {
            'text-color': 'white'
        },
        filter: ['==', 'PROVINCE', e.name]
    });
}

function handleProvinceFillLayer(e){
    map.addLayer({
        id: e.name + '-fill-boundary',
        type: 'fill',
        source: {
            type: 'geojson',
            data: e.provJson
        },
        paint: {
            'fill-color': e.fillColor,
            'fill-opacity': 0.7
        }
    });
}

function handleProvinceLabel(){
    map.addLayer({
        id: 'province-labels',
        type: 'symbol',
        source: {
            type: 'geojson',
            data: 'json/province-info.json'
        },
        layout: {
            'text-field': ['get', 'PROVINCE'],
            'text-font': [
            'DIN Offc Pro Medium',
                'Arial Unicode MS Regular'],
            'text-size': 20
        },
        paint: {
            'text-color': 'white'
        }
    });
}