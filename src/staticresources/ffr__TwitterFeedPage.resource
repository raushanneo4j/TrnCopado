<!DOCTYPE html>
<html>
	<head>
		<title>Twitter Feed Sandbox</title>
		<style>
			html,body {
				height: 100%;
				margin: 0;
				padding: 0;
			}

			.ffrrcp-twitter-placeholder {
				height: 100%;
				display: flex;
				flex-direction: column;
				align-items: center;
				font-size: 18px;
			}

			.ffrrcp-twitter-placeholder .ffrrcp-twitter-placeholder-spacer {
				flex: 1 1 auto;
			}
			.ffrrcp-twitter-placeholder .ffrrcp-twitter-loading-icon {
				width: 32px;
				height: 32px;
				background-size: 32px;
				background-image: url("data:image/gif;base64,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");
			}
			.ffrrcp-twitter-placeholder .ffrrcp-twitter-placeholder-error {
				display: none;
			}

			.ffrrcp-twitter-placeholder.twitter-timeline-error {
				background-color: #fafafa;
			}
			.ffrrcp-twitter-placeholder.twitter-timeline-error .ffrrcp-twitter-loading-icon {
				display: none;
			}
			.ffrrcp-twitter-placeholder.twitter-timeline-error .ffrrcp-twitter-placeholder-icon {
				background-image: url("data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxOC4xLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iZ3JpZC1lcnJvciIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiDQoJIHZpZXdCb3g9IjAgMCAxNiAxNiIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTYgMTYiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPHBvbHlnb24gZmlsbD0iI0Q3NEUzRCIgcG9pbnRzPSI0Ljc0MDcsMTYgMCwxMS4yNTkzIDAsNC43NDA3IDQuNzQwNywwIDExLjI1OTMsMCAxNiw0Ljc0MDcgMTYsMTEuMjU5MyAxMS4yNTkzLDE2ICIvPg0KPHJlY3QgZmlsbD0ibm9uZSIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ii8+DQo8cmVjdCB4PSI3IiB5PSIxMCIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjIiIGhlaWdodD0iMiIvPg0KPHJlY3QgeD0iNy4wMjU4IiB5PSI0IiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMS45NzQyIiBoZWlnaHQ9IjUiLz4NCjwvc3ZnPg0K");
				width: 32px;
				height: 32px;
				background-size: 32px;
			}
			.ffrrcp-twitter-placeholder.twitter-timeline-error .ffrrcp-twitter-placeholder-msg-not-found {
				display: block;
				text-align: center;
			}

			.ffrrcp-twitter-error .ffrrcp-twitter-placeholder .ffrrcp-twitter-loading-icon {
				display: none;
			}
			.ffrrcp-twitter-error .ffrrcp-twitter-placeholder .ffrrcp-twitter-placeholder-icon {
				background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxOS4xLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0ib3Blbi1saW5rIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDEzIDEwIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCAxMyAxMCIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8cGF0aCBmaWxsPSIjMTc4MUM5IiBkPSJNMTEuOTk3MiwwLjAwNzZWMEgydjIuMjk1MWgwLjAwMjh2NS43MDU3TDEzLDhWMEwxMS45OTcyLDAuMDA3NnogTTMuMDAyOCw3LjAwMDlMMywyaDl2NUwzLjAwMjgsNy4wMDA5eiIvPg0KPHBvbHlnb24gZmlsbD0iIzE3ODFDOSIgcG9pbnRzPSIxMCw4IDEwLDkgMSw5IDEsMyAyLDMgMiwyIDAsMiAwLDEwIDExLDEwIDExLDggIi8+DQo8L3N2Zz4NCg==');
				width: 39px;
				height: 30px;
				background-size: 39px 30px;
			}
			.ffrrcp-twitter-error .ffrrcp-twitter-placeholder .ffrrcp-twitter-placeholder-error {
				display: block;
				text-align: center;
			}
		</style>

		<script>
			var $Params = new URLSearchParams(document.location.search.substring(1));

			/*
			 * If the Twitter script fails to load (asynchronously) then:
			 *	- show a link to open the feed on its own page.
			 */
			function onLoadError () {
				if (window['twttr'] === undefined) {
					document.body.classList.add('ffrrcp-twitter-error');
				} else {
					document.body.classList.remove('ffrrcp-twitter-error');
				}
			}

			function htmlEncode (str) {
				return str
					.replace(/&/g, '&amp;')
					.replace(/"/g, '&quot;')
					.replace(/'/g, '&#39;')
					.replace(/</g, '&lt;')
					.replace(/>/g, '&gt;');
			}

			function stringFormat () {
				var args = Array.prototype.slice.call(arguments),	// convert to a real array
					format = args.shift();							// remove format string from the argument list

				return format.replace(/\{(\d+)\}/g, function (match, index) {
					return args[index];
				});
			}

			function generateHref (handle) {
				return stringFormat('https://twitter.com/{0}', encodeURIComponent(handle));
			}

			function generateSpacerMarkup () {
				// Unfortunately we can't depend on our parent container to centre us, so we have
				// to add additional spacer divs to center our error messages.
				return '<div class="ffrrcp-twitter-placeholder-spacer"></div>';
			}

			function generateLoadingIconMarkup () {
				return '<div class="ffrrcp-twitter-loading-icon"></div>';
			}

			function generateWidgetErrorMarkup (handle) {
				var labelText = $Params.get('ComponentWidgetNotLoadedPlaceholder'),
					placeholder = '%Open {0} Twitter profile in new tab.%',
					msg = labelText || placeholder,
					formattedMsg = htmlEncode(stringFormat(msg, handle));

				return stringFormat('<div class="ffrrcp-twitter-placeholder-icon"></div><div class="ffrrcp-twitter-placeholder-error">{0}</div>',
					formattedMsg
				);
			}

			function generateProfileNotFoundMessageMarkup (handle) {
				var labelText = $Params.get('ComponentCouldNotFindProfile'),
					placeholder = '%Twitter has failed to find the "{0}" profile%',
					msg = labelText || placeholder,
					formattedMsg = 	htmlEncode(stringFormat(msg, handle));

				return stringFormat('<div class="ffrrcp-twitter-placeholder-msg-not-found">{0}</div>',
					formattedMsg
				);
			}

			function generateTwitterPlaceholderMarkup (handle) {
				var placeholder = '<a id="placeHolder" class="{0}" href="{1}" target="_blank">{2}{3}{4}{5}{2}</a>';

				return stringFormat(placeholder,
					'twitter-timeline ffrrcp-twitter-placeholder',		// {0}
					generateHref(handle), 								// {1}
					generateSpacerMarkup(), 							// {2}
					generateLoadingIconMarkup(), 						// {3}
					generateWidgetErrorMarkup(handle),					// {4}
					generateProfileNotFoundMessageMarkup(handle)		// {5}
				);
			}

			/*
			 * The default rendering is the 'loading' state:
			 *	- this shows an error message as it should be replaced before you can read it (and not being replaced is an error)
			 */
			function insertWidget (handle) {
				var markup = generateTwitterPlaceholderMarkup(handle),
					placeHolder;

				document.body.innerHTML = markup;		// the Twitter library will detect our placeholder and replace it with the feed when it loads
				placeHolder = document.getElementById('placeHolder');
				if (window['twttr'] !== undefined) {
					twttr.widgets.load(placeHolder);
				}
			}
		</script>
		<script src="https://platform.twitter.com/widgets.js" onerror="onLoadError();" async defer></script>
	</head>
	<body>
		<script>
			insertWidget($Params.get('handle'));
		</script>
	</body>
</html>
