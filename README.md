# date_time_text_form_field

A date and time picker form field. It support from operations such as validate, save and changed. You can change its display format by setting parameter format.

# Date
<img src="date.png" height="500px">

<p><strong>Como usar</strong></p>
<p>DateTextFormField(<br />&nbsp; &nbsp; decoration: null, //optional<br /> &nbsp; &nbsp; value: null, //Default is DateTime.now(),<br /> &nbsp; &nbsp; labelText: 'Date label',<br /> &nbsp; &nbsp; onChanged: (DateTime value) {<br /> &nbsp; &nbsp;&nbsp; &nbsp; print(value);<br /> &nbsp; &nbsp; },<br /> &nbsp; &nbsp; validator: null, //optional,<br />);</p>

# Time
<img src="time.png" height="500px">

<p><strong>Como usar</strong></p>
<p>TimeTextFormField(<br />&nbsp; &nbsp; decoration: null, //optional<br /> &nbsp; &nbsp; value: null, //Default is TimeOfDay.now(),<br /> &nbsp; &nbsp; labelText: 'Time label',<br /> &nbsp; &nbsp; onChanged: (TimeOfDay value) {<br /> &nbsp; &nbsp;&nbsp; &nbsp; print(value);<br /> &nbsp; &nbsp; },<br /> &nbsp; &nbsp; validator: null, //optional,<br />);</p>
