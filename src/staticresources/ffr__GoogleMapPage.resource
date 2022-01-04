<!DOCTYPE html>
<html>
	<head>
		<title>Google Maps Sandbox</title>
		<style>
			.mapHolder {
				height: 100%;
			}
			html,body {
				height: 100%;
				margin: 0;
				padding: 0;
			}
			.mapError {
				display: none;
				height: 100%;
				background-color: #fafafa;
				flex-direction: column;
				align-items: center;
				font-size: 18px;
			}
			.showError .mapHolder {
				display: none;
			}
			.showError .mapError {
				display: flex;
			}
			.errorIcon {
				background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxOS4xLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iYWxlcnQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgMzIgMzIiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDMyIDMyIiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxwYXRoIGZpbGw9IiNCM0IyQjMiIGQ9Ik0xNiwzLjAwMDRjNy4xNjgsMCwxMi45OTk2LDUuODMxNiwxMi45OTk2LDEyLjk5OTZTMjMuMTY4LDI4Ljk5OTYsMTYsMjguOTk5NlMzLjAwMDQsMjMuMTY4LDMuMDAwNCwxNg0KCVM4LjgzMiwzLjAwMDQsMTYsMy4wMDA0IE0xNiwyLjAwMDRDOC4yNjgyLDIuMDAwNCwyLjAwMDQsOC4yNjgyLDIuMDAwNCwxNlM4LjI2ODIsMjkuOTk5NiwxNiwyOS45OTk2UzI5Ljk5OTYsMjMuNzMxOCwyOS45OTk2LDE2DQoJUzIzLjczMTgsMi4wMDA0LDE2LDIuMDAwNEwxNiwyLjAwMDR6Ii8+DQo8Zz4NCgk8cGF0aCBmaWxsPSIjNjY2NjY2IiBkPSJNMTYuMDAwNywxOS4wODYyYzEuMDc4MiwwLDEuODgyMSwwLjg0NTgsMS44ODIxLDEuOTY3M2MwLDEuMDk5OC0wLjgwMzksMS45NDYzLTEuODgyMSwxLjk0NjMNCgkJYy0xLjA3OTYsMC0xLjg4MzUtMC44NDY1LTEuODgzNS0xLjk0NjNDMTQuMTE3MiwxOS45MzIsMTQuOTIxMSwxOS4wODYyLDE2LjAwMDcsMTkuMDg2MnogTTE0LjU0MDEsMTEuMzg2MUwxNC40MzQ3LDguNTczaDMuMTMwNg0KCQlsLTAuMTA1NCwyLjgxMzFsLTAuNDQ0NSw2LjQ3MzNoLTIuMDMwOEwxNC41NDAxLDExLjM4NjF6Ii8+DQo8L2c+DQo8cmVjdCBmaWxsPSJub25lIiB3aWR0aD0iMzIiIGhlaWdodD0iMzIiLz4NCjwvc3ZnPg0K');
				width: 24px;
				height: 24px;
			}
			.errorPadding {
				flex: 1 1 auto;
			}
		</style>

		<script>
			var $Params = new URLSearchParams(document.location.search.substring(1));

			function stringFormat () {
				var args = Array.prototype.slice.call(arguments),	// convert to a real array
					format = args.shift();							// remove format string from the argument list

				return format.replace(/\{(\d+)\}/g, function (match, index) {
					return args[index];
				});
			}

			function addMarker (gmap, marker, location) {
				marker = Object.assign({
					map: gmap
				}, marker);
				if (!marker.position) {
					marker.position = location;
				}
				if (!marker.position) {
					marker.position = new google.maps.LatLng(marker.lat, marker.lng);
				}

				new google.maps.Marker(marker);
			}

			function createMap (location, marker) {
				var options = {
						zoom: 14,
						center: location,
						mapTypeId: google.maps.MapTypeId.ROADMAP
					},
					mapHolder = document.getElementById('mapHolder'),
					gmap = new google.maps.Map(mapHolder, options);

				if (marker) {
					addMarker(gmap, marker, location);
				}
			}

			function populateAndActivateGoogleError (errorMessage) {
				var errorText = document.getElementById('errorText');

				errorText.innerText = errorMessage;
				document.body.classList.add('showError');
			}

			window.googleResponseHandler = {
				OK: function (data, response, address, marker) {
					document.body.classList.remove('showError');	// success!
					createMap(data[0].geometry.location, marker);
				},
				ZERO_RESULTS: function (data, response, address, marker) {
					populateAndActivateGoogleError(stringFormat($Params.get('LabelNoResults'), address));
				},
				OVER_QUERY_LIMIT: function (data, response, address, marker) {
					populateAndActivateGoogleError($Params.get('LabelQueryLimit'));
				},
				REQUEST_DENIED: function (data, response, address, marker) {
					populateAndActivateGoogleError($Params.get('LabelRequestDenied'));
				},
				INVALID_REQUEST: function (data, response, address, marker) {
					populateAndActivateGoogleError($Params.get('LabelInvalidRequest'));
				},
				UNKNOWN_ERROR: function (data, response, address, marker) {
					populateAndActivateGoogleError($Params.get('LabelUnknownError'));
				}
			};

			function onLookupComplete (address, marker, data, response) {
				var handler = window.googleResponseHandler[response];

				handler(data, response, address, marker);
			}

			function lookupCode (address, marker) {
				var geocoder = new google.maps.Geocoder();

				geocoder.geocode({
					address: address
				}, onLookupComplete.bind(document, address, marker));
			}

			function initMap () {
				var address = $Params.get('address'),
					marker = JSON.parse($Params.get('marker'));

				lookupCode(address, marker);
			}
		</script>

		<script src="https://maps.googleapis.com/maps/api/js?v=3&client=gme-financialforcecom&callback=initMap" async defer></script>
	</head>
	<body>
		<div id="mapHolder" class="mapHolder"></div>
		<div id="mapError" class="mapError">
			<div class="errorPadding"></div>
			<div class="errorIcon"></div>
			<div id="errorText"></div>
			<div class="errorPadding"></div>
		</div>
	</body>
</html>
