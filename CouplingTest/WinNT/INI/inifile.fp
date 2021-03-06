s��        ^<   1 R�  l   �    e�                               Ini         Reading/Writing .ini-Style Files                 � ��unsigned char *     �  const unsigned char[]     � ��const char *     �  const char []     � ��Ini_OutputFunc     � ��Ini_InputFunc     � ��Ini_SectionFilterFunc     � ��IniText  2    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This instrument driver provides a simple interface for storing and accessing hierarchical configuration information using <span id="Monospace">.ini</span>-style files or Windows Registry Keys.</p>  

<p class="Body">In order to increase speed, this instrument driver has not been implemented with any multithread-safe locking.  We recommend that you do not share access to the same <span id="Monospace">.ini</span> file among multiple threads.  It is all right to have multiple <span id="Monospace">.ini</span> files coexisting with multiple threads, as long has no single <span id="Monospace">.ini</span> file is shared among the threads.</p>

<p class="Body"><span id="Monospace">.ini</span>-style files have the following format:</p>

    <p class="Body">
    [section 1]<br>
    tag 1 = &quot;string value 1&quot;<br>
    tag 2 = &quot;string value 2&quot;<br>
    tag 3 = 53</p>

    <p class="Body">
    [section 2]<br>
    tag 1 = True<br>
    tag 2 = &ndash;12.3</p>

<p class="Body">where &quot;section 1&quot;, &quot;section 2&quot;, &quot;tag 1&quot;, &quot;tag 2&quot;, and &quot;tag 3&quot; are user-defined names.  The number of sections and tags is unlimited.</p><br>  

<p class="Body">The Windows Registry has the following format:</p>

    <p class="Body">
    Root Key<br>
    &nbsp;&nbsp;SubKey 1<br>
    &nbsp;&nbsp;&nbsp;&nbsp;Value Name 1&nbsp;&nbsp;Value Data<br>
    &nbsp;&nbsp;SubKey 2<br>
    &nbsp;&nbsp;&nbsp;&nbsp;Value Name 2&nbsp;&nbsp;Value Data</p>

<p class="Body">where &quot;SubKey 1&quot;, &quot;SubKey 2&quot;, &quot;Value Name 1&quot; and &quot;Value Name 2&quot; are user-defined names, but &quot;Root Key&quot; is one of a number of system-defined values.</p><br>

<p class="Body">This instrument will help you access, store, and manipulate &quot;Sections&quot; of configuration information, each containg &quot;tag/value pairs&quot;.  For <span id="Monospace">.ini</span> files, Sections correspond to bracketed entries in the file, where each Section will usually group logically a number of tag&#61;value entries (tag/value pairs).</p>

<p class="Body">For Windows Registry branches, all configuration information for your application should be contained in a branch starting at a user-defined Base Key, descending from one of the system-defined Root Keys.  Each SubKey under the Base Key corresponds to a Section, where each value-name/value-data pair under that Key is considered a tag/value pair.</p>

<p class="Body">This instrument driver supports the following logical value types:
</p>
    <p class="Body">
    strings<br>
    integers<br>
    unsigned integers<br>
    doubles<br>
    boolean</p><br>

<p class="Body">Strings can be of unlimited size.  If in an <span id="Monospace">.ini</span>-style file and  more than 80 characters in length, they are broken into multiple lines.  Each line has a tag suffix, as in:</p>

    <p class="Body">
    [section 1]<br>
    tag 1 line 0001 = &quot;This is the first line of a very long &quot;<br>
    tag 1 line 0002 = &quot;paragraph.  This is the second line&quot;<br>
</p>
<p class="Body">Unprintable characters are written using hexadecimal escape codes.</p>

<p class="Body">For Windows Registry storage, all data is actually string data.  Your application is free to interpret the data in any supported format, however.</p>

<p class="Body">For writing this type of configuration information to the system, the general approach is to  build up the tag/value pairs in memory and then to write the entire file or Registry branch at once. For reading, the general approach is to read the entire file or Key branch into memory at once, and then to interrogate individual tag/value pairs.</p>

<p class="Body">To write a file with two sections, each containing two tags, the code (without error checking) might look similar to the following:</p>

    <p class="Code">IniText iniText;<br>
    char pathName[MAX_PATHNAME_LEN];<br>
    char dirName[MAX_PATHNAME_LEN];<br><br>

    /* set up the pathName for the .ini file */<br>
    GetProjectDir (dirName);<br>
    MakePathname (dirName, &quot;myconfig.ini&quot;, pathName);<br><br>

    /* create object for holding the value/tag pairs */<br>
    iniText = Ini_New (TRUE);   /* TRUE for automatic sorting */<br><br>

    /* create the in-memory tag/value pairs */<br>
    Ini_PutString (iniText, &quot;section 1&quot;, &quot;tag 1&quot;, &quot;string 1&quot;);<br>
    Ini_PutString (iniText, &quot;section 1&quot;, &quot;tag 2&quot;, &quot;string 2&quot;);<br>
    Ini_PutInt (iniText, &quot;section 2&quot;, &quot;tag 1&quot;, 53);<br>
    Ini_PutBoolean (iniText, &quot;section 2&quot;, &quot;tag 2&quot;, TRUE);<br><br>

    /* write out the tag/value pairs */<br>
    Ini_WriteToFile (iniText, pathName);<br><br>

    /* dispose of the in-memory tag/value pairs */<br>
    Ini_Dispose (iniText);</p><br>

<p class="Body">To read the same file, the code (without error checking) might look similar to the following:</p>

    <p class="Code">IniText iniText;<br>
    char pathName[MAX_PATHNAME_LEN];<br>
    char dirName[MAX_PATHNAME_LEN];<br>
    char *str1, *str2;<br>
    int intVal, boolVal;<br><br>

    /* set up the pathName for the .ini file */<br>
    GetProjectDir (dirName);<br>
    MakePathname (dirName, &quot;myconfig.ini&quot;, pathName);<br><br>

    /* create object for holding the value/tag pairs */<br>
    iniText = Ini_New (TRUE);   /* TRUE for automatic sorting */<br><br>

    /* read in the tag/value pairs */<br>
    Ini_ReadFromFile (iniText, pathName);<br><br>

    /* create the in-memory tag/value pairs */<br>
    Ini_GetStringCopy (iniText, &quot;section 1&quot;, &quot;tag 1&quot;, &amp;str1);<br>
    Ini_GetStringCopy (iniText, &quot;section 1&quot;, &quot;tag 2&quot;, &amp;str2);<br>
    Ini_GetInt (iniText, &quot;section 2&quot;, &quot;tag 1&quot;, &amp;intVal);<br>
    Ini_GetBoolean (iniText, &quot;section 2&quot;, &quot;tag 2&quot;, &amp;boolVal);<br><br>

    /* dispose of the in-memory tag/value pairs */<br>
    Ini_Dispose (iniText);</p><br>



<p class="Body">The advantages of storing information in this type of standard  fashion are:</p>

<ul><li>Humans can read (and potentially edit) the files and Keys.</li>
<li>Adding new information to the file does not change its format. 
  This makes backwards compatability virtually automatic.</li>
<li>The same file can be used by multiple independent modules or
  programs, as long as each uses unique section names.</li></ul>


<p class="Body">The additional advantage of using <span id="Monospace">.ini</span>-style files over the Windows Registry is platform independence (no byte packing, alignment, OS-dependence, or endianization issues).</p>

<p class="Body">The disadvantage of storing information in this fashion is:</p>

<ul><li>A binary format has the maximum potential for size and speed
  optimization.</li></ul>


<p class="Body">While it may seem that the section/item organization of this type of storage limits the data to two levels of hierarchy, it is possible to obtain multiple levels of hierarchy by adding a prefix for each level of hierarchy to the section names.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;This instrument makes extensive use of dynamic memory and will therefore run much slower if the project's debugging level (set in the project window's <strong>Options</strong> menu, <strong>Run Options</strong> item) is set to extended.</td></tr></table>

</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_Management</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This class contains functions to:</p>

   <ul><li>create and dispose an object which can contain an in-memory 
     list of tag/value pairs.</li>

   <li>sort the in-memory list of tag/value pairs</li>
   
   <li>write the in-memory list of tag/value pairs to a file</li>

   <li>read a list of tag/value pairs from a file</li>

   <li>write the in-memory list of tag/value pairs to the Windows
     Registry</li>

   <li>Read a list of tag/value pairs from the Windows Registry </li></ul>


</body>
</html>    =    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PuttingTagValuePairs</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This class contains functions to add tag/value pairs to the in-memory list. </p>

</body>
</html>
    U    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GettingValuesFromTags</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This class contains functions to obtain values associated with tags in the in-memory tag/value list.</p>

</body>
</html>    D    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_Informational</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This class contains functions which return information about the in-memory tag/value list.</p>

</body>
</html>
    a    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_RemovingSectionsAndItems</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This class provides functions for deleting sections and items from a list of in&ndash;memory tag/value pairs.</p>

</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_New</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This function creates an object which can contain an in-memory list of tag/value pairs within sections.  You can:</p>

<ul><li>Read tag/value pairs into this object using the 
    <span id="Monospace">Ini_ReadFromFile</span> or <span id="Monospace">Ini_ReadFromRegistry</span> functions, and
    then obtain the values using the <span id="Monospace">Ini_Get...</span> functions;  or</li>

<li>Insert tag/value pairs into this object using the 
    <span id="Monospace">Ini_Put...</span> functions, and then write the tag/value 
    pairs to the system using the <span id="Monospace">Ini_WriteToFile</span> or 
    <span id="Monospace">Ini_WriteToRegistry</span> functions.</li></ul>

<p class="Body">Since this instrument driver has not been implemented with any multithread-safe locking, we recommend that you do not share the same .ini object among multiple threads.  It is all right to have multiple .ini objects among multiple threads as long has no single .ini object is shared among the threads.</p>

<p class="Body">This function allows you to choose whether the in-memory list is automatically sorted.  See the help text for the Automatic Sorting control for information regarding how automatic sorting affects performance.</p>

<p class="Body">By default, each time you add an object to the in-memory list using one of the Ini_Put functions, a check is made for items with the same name.  This can prevent unwanted duplicates, but it also can slow performance.  You can disable this feature using the <span id="Monospace">Ini_SetDuplicateChecking</span> function.</p>

</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_New</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The handle to the object created in this function.</p>

<p class="Body">0 is returned if there is not enough memory.</p>

<p class="Body">Use this handle as the first parameter to all of the other functions in this instrument driver.</p>


</body>
</html>    _    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_New</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">If you pass a non-zero value, the in-memory list of tag/value pairs is maintained in sorted order.</p>   

<p class="Body">The sorting is based on section name, and tag name within section name.  The sorting is done on a case-insensitive basis.</p>

<p class="Body">If you pass a zero value, the sections and tags are kept in the order created (or read from the file).</p>

<p class="Body">You can dynamically change the sorting mode by calling <span id="Monospace">Ini_Sort</span> or <span id="Monospace">Ini_DisableSorting</span>.</p><br>


<p class="Body">Effect of Sorting on Performance</p>
<hr>

<p class="Body">If sorting is enabled, the following performance characteristics hold:</p>

  <ul><li> Getting values from the in-memory list is faster. </li> 

  <li> If checking for duplicates is enabled (the default),
    adding values to the in-memory list is faster than  
    it would be for a non-sorted list.</li>

  <li> If checking for duplicates is disabled, 
    adding values to the in-memory list is slower than
    it would be for a non-sorted list.  (See the 
    <span id="Monospace">Ini_SetDuplicateChecking</span> function.)</li></ul>


</body>
</html>    .�����  x    Handle                          ���� � Q��                                           0� =           Automatic Sorting?                 	            �Note:  In CVI 4.0.1, checks for duplicate items were added in each Ini_Put function.
           This may slow performance.    You can disable this feature by using the 
           Ini_SetDuplicateChecking function.   Yes 1 No 0   <    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_Dispose</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Disposes of the in-memory list of tag/value pairs identified by <strong>Handle</strong>.</p>


</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_Dispose</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>. It represents the list of in-memory tag/value pairs.</p>

<p class="Body">Zero may be passed, and <span id="Monospace">Ini_Dispose()</span> will return without doing anything.</p>


</body>
</html>    8� = �  �  x    Handle                                b    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_Sort</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Sorts the tag/value pairs in the list identified by <strong>Handle</strong>. The list automatically remains sorted until you call <span id="Monospace">Ini_DisableSorting</span>.</p>

<p class="Body">The sorting is based on section name, and tag name within section name.  The sorting is done on a case-insensitive basis.</p>

<p class="Body">If automatic sorting was specified in the call to <span id="Monospace">Ini_New()</span> when the tag/value list was created, then the list is already sorted and this function will do nothing.</p><br>


<p class="Body">Effect of Sorting on Performance</p>
<hr>

<p class="Body">If sorting is enabled, the following performance characteristics hold:</p>

  <ul><li>Getting values from the in-memory list is faster.</li>  

  <li>If checking for duplicates is enabled (the default),
    adding values to the in-memory list is faster than  
    it would be for a non-sorted list.</li>

  <li>If checking for duplicates is disabled, 
    adding values to the in-memory list is slower than
    it would be for a non-sorted list.  (See the 
    <span id="Monospace">Ini_SetDuplicateChecking</span> function.)</li></ul>






</body>
</html>    Q    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_Sort</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>. It represents the list of in-memory tag/value pairs.</p>


</body>
</html>    @M = �  �  x    Handle                                *    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_DisableSorting</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Disables automatic sorting of the in-memory list.  Does not affect the current order of the tag-value pairs in the list.</p>

<p class="Body">To reenable automatic sorting, call <span id="Monospace">Ini_Sort</span>.</p><br>


<p class="Body">Effect of Sorting on Performance</p>
<hr>

<p class="Body">If sorting is enabled, the following performance characteristics hold:</p>

  <ul><li>Getting values from the in-memory list is faster.</li>  

  <li>If checking for duplicates is enabled (the default),
    adding values to the in-memory list is faster than  
    it would be for a non-sorted list.</li>

  <li>If checking for duplicates is disabled, 
    adding values to the in-memory list is slower than
    it would be for a non-sorted list.  (See the 
    <span id="Monospace">Ini_SetDuplicateChecking</span> function.)</li></ul>


</body>
</html>    _    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_DisableSorting</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    F = �  �  x    Handle                                L    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SortInternally</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This function gives the same performance benefits as <span id="Monospace">Ini_Sort()</span>, but it does not alter the order of the tag/value pairs in the list identified by <strong>Handle</strong>.</p> 

<p class="Body">When internal sorting is enabled by this function, an additional internal list of pointers to tag/value pairs is created, sorted, and used to speed up IniText operations.  The original list is maintained as well so that the order of the tag/value pairs in the list is preserved when the IniText is written to a file or traversed using the <span id="Monospace">Ini_NthItemName()</span> and <span id="Monospace">Ini_NthSectionName()</span> functions. </p>  

<p class="Body">If the Ini_Text has enabled regular sorting by calling <span id="Monospace">Ini_Sort()</span> or by passing TRUE to <span id="Monospace">Ini_New()</span> then enabling internal sorting with this function will not improve performance any further.</p>

<p class="Body">See the help for <span id="Monospace">Ini_Sort()</span>.</p>


<p class="Body">Effect of Sorting on Performance</p>
<hr>

<p class="Body">If sorting is enabled, the following performance characteristics hold:</p>

  <ul>
 <li>Getting values from the in-memory list is faster.  </li>

 <li>If checking for duplicates is enabled (the default),
    adding values to the in-memory list is faster than  
    it would be for a non-sorted list.</li>

  <li>If checking for duplicates is disabled, 
    adding values to the in-memory list is slower than
    it would be for a non-sorted list.  (See the 
    <span id="Monospace">Ini_SetDuplicateChecking</span> function.)</li></ul>




</body>
</html>
    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SortInternally</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in userint.h.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">The only error you are likely to encounter is:</p>

    <p class="Body">&ndash;12&nbsp;&nbsp;&nbsp;Out of memory!</p>

</body>
</html>
    _    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SortInternally</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    O���    x    Status                            Q� = �  �  x    Handle                             	               �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_DisableInternalSorting</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Disables automatic internal sorting of the in-memory list. </p> 

<p class="Body">To reenable automatic internal sorting, call <span id="Monospace">Ini_SortInternally()</span>.</p>

<p class="Body">Refer to the help for <span id="Monospace">Ini_SortInternally()</span> for information on internal sorting.</p><br>


<p class="Body">Effect of Sorting on Performance</p>
<hr>

<p class="Body">If sorting is enabled, the following performance characteristics hold:</p>

  <ul><li>Getting values from the in-memory list is faster.</li>  

  <li>If checking for duplicates is enabled (the default),
    adding values to the in-memory list is faster than  
    it would be for a non-sorted list.</li>

  <li>If checking for duplicates is disabled, 
    adding values to the in-memory list is slower than
    it would be for a non-sorted list.  (See the <span id="Monospace">Ini_SetDuplicateChecking</span> function.)</li></ul>




</body>
</html>    g    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_DisableInternalSorting</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    Xl = �  �  x    Handle                                �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteToFile</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Writes the tag/value pairs in the list identified by <strong>Handle</strong> to the file identified by <strong>Pathname</strong>.</p>

<p class="Body">If you want to write the data to a destination other than a file, use the <span id="Monospace">Ini_WriteGeneric</span> function.</p>


</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteToFile</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">Among the more commonly encountered errors are:</p>

    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
    <tr><td>&ndash;91</td>  <td>Too many files are open.</td></tr>
    <tr><td>&ndash;93</td>  <td>Input/Output error.</td></tr>
    <tr><td>&ndash;94</td>  <td>File not found.</td></tr>
    <tr><td>&ndash;95</td>  <td>File access permission denied.</td></tr>
    <tr><td>&ndash;97</td>  <td>Disk is full.</td></tr>
    <tr><td>&ndash;99</td>  <td>File already open.</td></tr>
   <tr><td>&ndash;100</td>  <td>Badly formed pathname.</td></tr>
  <tr><td><nobr>&ndash;</nobr>5003</td>  <td>Could not generate an unused temporary file name in the
         same directory as the output file.</td></tr>
  <tr><td><nobr>&ndash;</nobr>5004</td>  <td>Could not create a temporary file in the same 
         directory as the output file.</td></tr>
</table>

</body>
</html>    \    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteToFile</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    ;    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteToFile</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The pathname of the file to which to write the tag/value pairs.
If a file with that pathname already exists, it will be overwritten.</p>

<p class="Body">If the pathname is not absolute, the file is created relative to the current working directory.
</p>

<p class="Body">Pass 0 to write the tag/value pairs to the standard output stream.
</p>


</body>
</html>    \���    x    Status                            b/ = d  �  x    Handle                            c� =! �  �    Pathname                           	                ""       <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadFromFile</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Reads the tag/value pairs in the file identified by <strong>Pathname</strong> into the list identified by <strong>Handle</strong>.</p>

<p class="Body">If you want to read the data from a source other than a file or the Windows Registry, use the <span id="Monospace">Ini_ReadGeneric</span> function.</p>



</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadFromFile</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">Among the more commonly encountered errors are:</p>
    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
    <tr><td>&ndash;91</td>  <td>Too many files are open.</td></tr>
    <tr><td>&ndash;92</td>  <td>Unexpectedly reached end of file.</td></tr>
    <tr><td>&ndash;93</td>  <td>Input/Output error.</td></tr>
    <tr><td>&ndash;94</td>  <td>File not found.</td></tr>
    <tr><td>&ndash;95</td>  <td>File access permission denied.</td></tr>
    <tr><td>&ndash;99</td>  <td>File already open.</td></tr>
   <tr><td>&ndash;100</td>  <td>Badly formed pathname.</td></tr>
  <tr><td>&ndash;5001</td>  <td>Could not open file for reading</td></tr>
  <tr><td>&ndash;5002</td>  <td>Error reading file</td></tr>
</table>

</body>
</html>    ]    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadFromFile</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadFromFile</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The pathname of the file from which to read the tag/value pairs.</p>

<p class="Body">If the pathname is not absolute, the file is located relative to the current working directory.</p>


</body>
</html>    h����    x    Status                            n/ = d  �  x    Handle                            o� =! �  �    Pathname                           	                ""   5    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteToRegistry</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Writes the tag/value pairs in the list identified by <strong>Handle</strong> to the specified Windows Registry Key.  All values are written out as strings.</p>

<p class="Body">If you want to write the data to a destination other than a file or the Windows Registry, use the <span id="Monospace">Ini_WriteGeneric</span> function.</p>

</body>
</html>
    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteToRegistry</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">Among the more commonly encountered errors are:</p>
    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
    <tr><td>&ndash;91</td>  <td>Too many files are open.</td></tr>
    <tr><td>&ndash;93</td>  <td>Input/Output error.</td></tr>
    <tr><td>&ndash;94</td>  <td>File not found.</td></tr>
    <tr><td>&ndash;95</td>  <td>File access permission denied.</td></tr>
    <tr><td>&ndash;99</td>  <td>File already open.</td></tr>
   <tr><td>&ndash;100</td>  <td>Badly formed pathname.</td></tr>
  <tr><td><nobr>&ndash;5003</nobr></td>  <td>Could not generate an unused temporary file name in the
         same directory as the output file.</td></tr>
  <tr><td><nobr>&ndash;5004</nobr></td>  <td>Could not create a temporary file in the same 
         directory as the output file.</td></tr>
</table>

</body>
</html>


    `    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteToRegistry</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteToRegistry  </title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The Root Key in the Registry to write to.  The available Root Keys are:</p>

    <p class="Body"><span id="Monospace">
    HKEY_CLASSES_ROOT<br>
    HKEY_CURRENT_USER<br>
    HKEY_LOCAL_MACHINE<br>
    HKEY_USERS<br></span></p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;Applications typically store global configuration data
       under:</td></tr></table>

<p class="Body"><span id="Monospace">HKEY_LOCAL_MACHINE\\Software\\CompanyName\\AppName\\Version\\</span></p>

       <p class="Body">And per-user configuration data under:</p>

  <p class="Body"><span id="Monospace">HKEY_CURRENT_USER\\Software\\CompanyName\\AppName\\Version\\</span></p>

</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteToRegistry</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A NULL-terminated string containing the name of the Registry Subkey to which to write tag/value pairs.  The Subkey should be '\' separated and relative to the specified Root Key.</p>

<p class="Body">The following is an example of a valid Subkey string for the Root Key <span id="Monospace">HKEY_CURRENT_USER</span>:</p>

<p class="Body"><span id="Monospace">"Software\\National Instruments\\CVI\\5.0"</span></p>

<p class="Body">CVI stores its configuration under this subkey.  Do not store your program's information under this key.  Use the following convention to name the subkey under which to store your program's information:</p>

<p class="Body"><span id="Monospace">"Software\\Company Name\\Program Name\\Program Version"</span></p>

</body>
</html>    t,���    x    Status                            z = d  �  x    Handle                            {v =!    �    Root Key                          : � � �  �    Subkey Name                     ���� � ���                                            	                          JHKEY_CLASSES_ROOT 0 HKEY_CURRENT_USER 1 HKEY_LOCAL_MACHINE 2 HKEY_USERS 3        7This function is available only on Windows 9x/NT/2000.   �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadFromRegistry</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Reads tag/value pairs from the windows Registry into the list identified by <strong>Handle</strong>.</p>

<p class="Body">If you want to read the data from a source other than a file or the Windows Registry, use the <span id="Monospace">Ini_ReadGeneric</span> function.</p>

</body>
</html>


    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadFromRegistry</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">Among the more commonly encountered errors are:</p>
    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
    <tr><td>&ndash;91</td>  <td>Too many files are open.</td></tr>
    <tr><td>&ndash;92</td>  <td>Unexpectedly reached end of file.</td></tr>
    <tr><td>&ndash;93</td>  <td>Input/Output error.</td></tr>
    <tr><td>&ndash;94</td>  <td>File not found.</td></tr>
    <tr><td>&ndash;95</td>  <td>File access permission denied.</td></tr>
    <tr><td>&ndash;99</td>  <td>File already open.</td></tr>
   <tr><td>&ndash;100</td>  <td>Badly formed pathname.</td></tr>
  <tr><td><nobr>&ndash;5001</nobr></td>  <td>Could not open file for reading</td></tr>
  <tr><td><nobr>&ndash;5002</nobr></td>  <td>Error reading file</td></tr>
</table>

</body>
</html>

    a    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadFromRegistry</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadFromRegistry</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The Root Key in the Registry from which to read.  The available Root Keys are:</p>

    <p class="Body"><span id="Monospace">
    HKEY_CLASSES_ROOT<br>
    HKEY_CURRENT_USER<br>
    HKEY_LOCAL_MACHINE<br>
    HKEY_USERS</span></p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;Applications typically store global configuration data
       under:<br><br>

  <span id="Monospace">HKEY_LOCAL_MACHINE\\Software\\CompanyName\\AppName\\Version\\</span><br><br>

       And per-user configuration data under:<br><br>

  <span id="Monospace">HKEY_CURRENT_USER\\Software\\CompanyName\\AppName\\Version\\</span></td></tr></table>


</body>
</html>


    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadFromRegistry</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A NULL-terminated string containing the name of the Registry Subkey from which to read tag/value pairs.  The Subkey should be '\' separated and relative to the specified Root Key.</p>

<p class="Body">The following is an example of a valid Subkey string for the Root Key <span id="Monospace">HKEY_CURRENT_USER:</span></p>

    <p class="Body"><span id="Monospace">"Software\\National Instruments\\CVI\\5.0"</span></p>


</body>
</html>


    �����    x    Status                          ���� � ���                                           �i = d  �  x    Handle                            �� =!    �    Root Key                          �z � � �  �    Subkey Name                        	            7This function is available only on Windows 9x/NT/2000.                  JHKEY_CLASSES_ROOT 0 HKEY_CURRENT_USER 1 HKEY_LOCAL_MACHINE 2 HKEY_USERS 3       �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteGeneric</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Writes the tag/value pairs in the list identified by <strong>Handle</strong> to the specified <strong>Output Destination</strong> by calling the specified <strong>Output Function</strong>.</p>

<p class="Body">This function allows you to write the in-memory contents to any destination, such as a memory mapped file or a TCP/IP address.</p>

<p class="Body">If you want to write to a disk file, you can use the function <span id="Monospace">Ini_WriteToFile</span>.</p>



</body>
</html>
    \    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteGeneric</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">If the specified output function returns a negative value, the value is returned by <span id="Monospace">Ini_WriteGeneric</span>.</p>

<p class="Body">Among the more commonly encountered errors are:</p>
    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
    <tr><td>&ndash;91</td>  <td>Too many files are open.</td></tr>
    <tr><td>&ndash;93</td>  <td>Input/Output error.</td></tr>
    <tr><td>&ndash;94</td>  <td>File not found.</td></tr>
    <tr><td>&ndash;95</td>  <td>File access permission denied.</td></tr>
    <tr><td>&ndash;99</td>  <td>File already open.</td></tr>
   <tr><td>&ndash;100</td>  <td>Badly formed pathname.</td></tr>
  <tr><td><nobr>&ndash;5003</nobr></td>  <td>Could not generate an unused temporary file name in the same directory as the output file.</td></tr>
  <tr><td><nobr>&ndash;5004</nobr></td>  <td>Could not create a temporary file in the same directory as the output file.</td></tr>
</table>

</body>
</html>



    ]    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteGeneric</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteGeneric</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A pointer to a callback function that is called to write out each line of the IniText.</p>

<p class="Body">The prototype for the callback function is:</p>

   <p class="Code">int CVICALLBACK OutputFunc(void *outputDest, 
                              char *outputString);</p> 

<p class="Body">The callback function should return 0 if it successfully writes the <strong>outputString</strong> parameter.  Otherwise, it should return a negative error code, which is then returned by <span id="Monospace">Ini_WriteGeneric</span>.</p>

<p class="Body">Each call to the function represents one line.  It is the responsibility of the function to mark the end of the line in a manner appropriate to the destination type.</p>



</body>
</html>
    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_WriteGeneric</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A value representing the output destination.  This value is passed to the specified output function.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;   
  This value can be used pass a pointer to a structure which
  contains the information necessary for the output function to
  write to a particular destination, such as a memory mapped 
  file or a TCP/IP address.  </td></tr></table>



</body>
</html>
    �����    x    Status                            �� = d  �  x    Handle                            �K =! �  �    Output Function                   � � �    �    Output Destination                 	                       �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadGeneric</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Reads the tag/value pairs into the list identified by <strong>Handle</strong> from the specified <strong>Input Source</strong> by calling the specified <strong>Input Function</strong>.</p>

<p class="Body">This function allows you to read into memory data from any source, such as a memory mapped file or a TCP/IP address.</p>

<p class="Body">If you want to read from a disk file, you can use the function <span id="Monospace">Ini_ReadFromFile</span>.</p>



</body>
</html>

    \    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadGeneric</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    /    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadGeneric</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">If the specified input function returns a negative value, the value is returned by <span id="Monospace">Ini_ReadGeneric</span>.</p>

<p class="Body">Among the more commonly encountered errors are:</p>
    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
    <tr><td>&ndash;91</td>  <td>Too many files are open.</td></tr>
    <tr><td>&ndash;92</td>  <td>Unexpectedly reached end of file.</td></tr>
    <tr><td>&ndash;93</td>  <td>Input/Output error.</td></tr>
    <tr><td>&ndash;94</td>  <td>File not found.</td></tr>
    <tr><td>&ndash;95</td>  <td>File access permission denied.</td></tr>
    <tr><td>&ndash;99</td>  <td>File already open.</td></tr>
   <tr><td>&ndash;100</td>  <td>Badly formed pathname.</td></tr>
  <tr><td><nobr>&ndash;5001</nobr></td>  <td>Could not open file for reading</td></tr>
  <tr><td><nobr>&ndash;5002</nobr></td>  <td>Error reading file</td></tr>
</table>

</body>
</html>

        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadGeneric</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A pointer to a callback function that is called to read in each line of the IniText.</p>

<p class="Body">The prototype for the callback function is:</p>

   <p class="Syntax">
int CVICALLBACK InputFunc(void *inputSource, 
                          char *inputBuffer, int maxLineLength,
                          int *endOfSource, int *lineNumRead);</p>

<p class="Body">The callback function should return 0 if it successfully reads a line of text. Otherwise, it should return a negative error code, which is then returned by <span id="Monospace">Ini_ReadGeneric</span>.</p>

<p class="Body">The callback function should copy the line that it reads into the <strong>inputBuffer</strong> parameter as a NULL terminated string.  The <strong>maxLineLength</strong> parameter specifies the maximum number of characters (not including the NULL byte) that can be safely copied into the <strong>inputBuffer</strong>.  If your <strong>Input Function</strong> encounters a line longer than this limit, it can return a negative error code or it can discard the extra characters.  The default maximum line length is 255, which is specified as a macro in <span id="Monospace">inifile.c</span>.</p>

<p class="Body">The callback function should set the <strong>*endOfSource</strong> parameter to a non-zero value if there may be further lines to read.</p>

<p class="Body">The callback function should set the <strong>*lineNumRead</strong> parameter to the 1&ndash;based index of the line that was read.  If this information is not needed, <strong>*lineNumRead</strong> can be set to zero.
</p>



</body>
</html>
    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ReadGeneric</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A value representing the input source.  This value is passed to the specified input function.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;   
  This value can be used to pass a pointer to a structure which
  contains the information necessary for the input function to
  read from a particular source, such as a memory mapped file
  or a TCP/IP address.  </td></tr></table>


</body>
</html>
    �h = d  �  x    Handle                            �����    x    Status                            � =! �  �    Input Function                    � � �    �    Input Source                           	                   �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_CopySection</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This function copies a section of tag-value pairs from one in-memory list to another.</p>  

<p class="Body">If there already is a section of the same name in the Destination list, you have the option of overwriting the section or merging the two sections.  If you merge the two sections, items with the same tags are overwritten unless you have disabled duplicate checking using the <span id="Monospace">Ini_SetDuplicateChecking</span> function.
</p>


</body>
</html>

    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_CopySection</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>

<p class="Body">This list will be copied into the list specified by the <strong>Destination</strong> parameter.</p>



</body>
</html>
    *    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_CopySection</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">The only error you are likely to encounter is:</p>

    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
</table>

</body>
</html>
    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_CopySection</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>

<p class="Body">The contents of the Source list will be copied into this list.</p>




</body>
</html>
    w    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_CopySection</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This parameter specifies whether sections in the Source list completely overwrite previously existing sections with the same name in the Destination list.</p>

<p class="Body">If there a section in the Destination list has the same name as a section being copied, you have the option of overwriting the section or merging the two sections. If you merge the two sections, items with the same tags are overwritten unless you have disabled duplicate checking using the <span id="Monospace">Ini_SetDuplicateChecking</span> function.</p>

<p class="Body">Pass 1 (TRUE) to completely overwrite previously existing sections in the Destination.</p>

<p class="Body">Pass 0 (FALSE) to merge the items in sections with same name into the Destination list. Items with the same tag names are overwritten unless you have disabled duplicate checking using the <span id="Monospace">Ini_SetDuplicateChecking</span> function.</p>




</body>
</html>
    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_CopySection</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This parameter specifies the name of the section in the Source list to merge into the Destination List.</p>

<p class="Body">Pass 0 to merge all of the sections in the Source list into the Destination list.</p>




</body>
</html>

    �m = d  �  x    Source                            �E���    x    Status                            �w � d �  x    Destination                       �/ �a          Overwrite Duplicate Sections?     ʮ =! �  �    Section To Copy                        	               Yes 1 No 0    0   ,    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetTokens</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This function specifies the tokens used as delimiters in the text representation of the sections headings and tag/value pairs.</p>

<p class="Body">If you do not call this function, the default tokens are:</p>

    <table class="Borderless">
    <tr><td>Section Name Start Character</td>    <td>&quot;&#91;&quot;</td></tr>
    <tr><td>Section Name End Character</td>      <td>&quot;&#93;&quot;</td></tr>
    <tr><td>Value Separator</td>                 <td>&quot;&#61;&quot;</td></tr>
    <tr><td>Comment Marker</td>                 <td>&quot;&#59;&quot;</td></tr>
    </table>




</body>
</html>



 

        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetTokens</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This function always returns 0.</p>

</body>
</html>
    Z    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetTokens</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    g    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetTokens</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The character used to delimit the start of a section name.</p>

<p class="Body">Pass 0 to leave the current delimiter unchanged.</p>


</body>
</html>
    d    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetTokens</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The character used to delimit the end of a section name.</p>

<p class="Body">Pass 0 to leave the current delimiter unchanged.</p>

</body>
</html>
    c    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetTokens</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The string used to separate item tag names from values.</p>

<p class="Body">Pass 0 to leave the current delimiter unchanged.</p>

</body>
</html>
    i    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetTokens</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Pass the string used to mark the beginning of a comment line.</p>

<p class="Body">Pass 0 to leave the current delimiter unchanged.</p>

</body>
</html>
    �����    x    Status                            �� = 9  �  x    Handle                            �C = �    x    Section Name Start Character      Բ =s    x    Section Name End Character        � � 9 �  x    Value Separator                   ׉ � � �  x    Comment Marker                     	                '['    ']'    "="    ";"   �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetSectionFilter</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This function installs a callback function that controls which sections are read into the IniText during a call to <span id="Monospace">Ini_ReadFromFile()</span> or <span id="Monospace">Ini_ReadGeneric()</span>.</p>

<p class="Body">This filtering callback function is useful when you want to read a subset of a large <span id="Monospace">.ini</span> file without the overhead of reading the entire file into memory.</p>

</body>
</html>
        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetSectionFilter</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This function always returns 0.</p>



</body>
</html>
    a    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetSectionFilter</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetSectionFilter</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A pointer to a callback function that is called when each section name is read.  The value returned by this callback function determines whether the section is read into the IniText or discarded.</p>

<p class="Body">The prototype for the callback function is:</p>

   <p class="Syntax">int CVICALLBACK FilterFunction(IniText theIniText,
                             void *callbackData, 
                             char *sectionName);</p>

<p class="Body">The Filter Function should return 1 (TRUE) if the section is to be read into the IniText.  Otherwise, it should return 0 (FALSE).</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;You can pass 0 to remove a previously installed  
       Section Filter Function.
</td></tr></table>
</body>
</html>
    x    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetSectionFilter</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A user defined value that is passed to the Section Filter Function in its <strong>callbackData</strong> parameter each time it is called.</p>



</body>
</html>
    �����    x    Status                            � = n  �  x    Handle                            �x = �  �    Section Filter Function           � � �    �    Callback Data                      	                    0   �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetDuplicateChecking</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">By default, when you use one of the <span id="Monospace">Ini_Put</span> functions to add an item to the Ini_Text, a check is made for an existing item with a duplicate name.  If there is an existing item with a duplicate name, it is deleted.  This check can slow down the <span id="Monospace">Ini_Put</span> functions.  You can use this function to disable or reenable the duplicate checks.</p>

<p class="Body">When duplicate checking is on (the default setting), putting an item automatically replaces it if it already exists.</p>

<p class="Body">When duplicate checking is off, items are put without checking to see if they already exist.  This makes it possible for multiple items with the same name to be put into an IniText.  If more than one item has the same name, which value is returned by an <span id="Monospace">Ini_Get</span> function is undefined.</p>

<p class="Body">The only time this function should be used is when you want to speed up putting a large number of items by bypassing the check for duplicate items.  If you turn duplicate checking off, you are responsible for ensuring that no item is put into an IniText which already contains an item with the same name.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;The <span id="Monospace">Ini_Merge</span> function relies on the <span id="Monospace">Ini_Put</span> functions and is therefore subject the duplicate checking state of its Destination argument.</td></tr></table>


</body>
</html>
    1    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetDuplicateChecking</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Returns the previous duplicate checking setting for the IniText.</p>

</body>
</html>
    e    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetDuplicateChecking</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SetDuplicateChecking</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This parameter specifies whether the <span id="Monospace">Ini_Put</span> functions check for and delete existing items with duplicate names before adding an item to the Ini_Text.</p>

<p class="Body">Pass 1 to check for duplicates.</p>

<p class="Body">Pass 0 to disable duplicate checking.</p>

</body>
</html>
    �����    x    Previous Setting                  �" = �  �  x    Handle                            � =S          Check For Duplicates               	                Yes 1 No 0   �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Adds a tag/string pair to the tag/value list identified by <strong>Handle</strong>.  The string is associated with the tag identified by <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>

<p class="Body">If the string is very long, the instrument driver will split it across multiple lines associated with the same tag name.  This is done by generating new tag names, such as in:</p>

   <table class="Borderless">
   <tr><td>&lt;Tag Name&gt; Line 0001</td> <td>&#61; &quot;first part of line ........&quot;</td></tr>
   <tr><td>&lt;Tag Name&gt; Line 0002</td> <td>&#61; &quot;second part of line .......&quot;</td></tr>
   <tr><td>&lt;Tag Name&gt; Line 0003</td> <td>&#61; &quot;third part of line&quot;</td></tr>
   </table>
<p class="Body">When you attempt to retrieve the string from the file by calling <span id="Monospace">Ini_GetPointerToString</span>, <span id="Monospace">Ini_GetStringCopy</span>, or <span id="Monospace">Ini_GetStringIntoBuffer</span>, you only need to enter the same Tag Name that you passed into this function.  The instrument driver takes care of reconstructing the original single string from the  multiple lines.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;By default, the function checks for and deletes existing items with duplicate names.  You can disable the duplicate checking, and thereby increase performance, by calling <span id="Monospace">Ini_SetDuplicateChecking</span>.</td></tr></table>


</body>
</html>
    '    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">The only error you are likely to encounter is:</p>

    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
</table>

</body>
</html>    Z    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>         <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to place the tag/value pair.</p>


</body>
</html>
        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name to use in the tag/value pair.</p>


</body>
</html>
        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The string to associate with the tag name.</p>


</body>
</html>
    �`���    x    Status                            �� =   �  x    Handle                            �� = � �  �    Section Name                      � =f �  �    Tag Name                          2 �  �  �    String Value                       	                ""    ""    ""   O    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutRawString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Adds a tag/string pair to the tag/value list identified by <strong>Handle</strong>.  The string is associated with the tag identified by <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>


<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;This function is exactly like <span id="Monospace">Ini_PutString()</span> except that unprintable characters in the string are not translated into escape codes.  One possible use for this function is to write out a pathname in PC format.  Since PC pathnames contain backslashes and since the escape character used by <span id="Monospace">Ini_PutString()</span> is also the backslash, you must use <span id="Monospace">Ini_PutRawString()</span> if you do not want the back slashes in the pathname to be converted into double backslashes in the destination <span id="Monospace">.ini</span> file.  This is only an issue if you are using the inifile instrument to create entries that will not be read by one of the <span id="Monospace">Ini_GetString</span> functions in this instrument.  The non-raw versions of the <span id="Monospace">Ini_GetString</span> functions automatically recognize and remove the escape codes inserted by <span id="Monospace">Ini_PutString()</span>.</td></tr></table>

<p class="Body">If the string is very long, the instrument driver will split it across multiple lines associated with the same tag name.  This is done by generating new tag names, such as in:</p>

   <table class="Borderless">
   <tr><td>&lt;Tag Name&gt; Line 0001</td> <td>&#61; &quot;first part of line ........&quot;</td></tr>
   <tr><td>&lt;Tag Name&gt; Line 0002</td> <td>&#61; &quot;second part of line .......&quot;</td></tr>
   <tr><td>&lt;Tag Name&gt; Line 0003</td> <td>&#61; &quot;third part of line&quot;</td></tr></table>
   
<p class="Body">When you attempt to retrieve the string from the file by calling <span id="Monospace">Ini_GetPointerToString</span>, <span id="Monospace">Ini_GetStringCopy</span>, or <span id="Monospace">Ini_GetStringIntoBuffer</span>, you only need to enter the same Tag Name that you passed into this function.  The instrument driver takes care of reconstructing the original single string from the  multiple lines.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;By default, the function checks for and deletes existing items with duplicate names.  You can disable the duplicate checking, and thereby increase performance, by calling <span id="Monospace">Ini_SetDuplicateChecking</span>.
</td></tr></table>




</body>
</html>

    =    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutRawString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
</table>

</body>
</html>    ]    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutRawString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    %    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutRawString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to place the tag/value pair.</p>



</body>
</html>

        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutRawString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name to use in the tag/value pair.</p>



</body>
</html>

        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutRawString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The string to associate with the tag name.</p>



</body>
</html>

   ����    x    Status                            =   �  x    Handle                           w = � �  �    Section Name                     � =f �  �    Tag Name                         � �  �  �    String Value                       	                ""    ""    ""   7    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Adds a tag/integer pair to the tag/value list identified by <strong>Handle</strong>.  The integer value is associated with the tag identified by <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;By default, the function checks for and deletes existing items with duplicate names.  You can disable the duplicate checking, and thereby increase performance, by calling <span id="Monospace">Ini_SetDuplicateChecking</span>.
</td></tr></table>


</body>
</html>


    9    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
</table>

</body>
</html>

    W    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to place the tag/value pair.</p>


</body>
</html>

        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name to use in the tag/value pair.</p>


</body>
</html>

        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The integer value to associate with the Tag Name.</p>


</body>
</html>

   J���    x    Status                           � =   �  x    Handle                           � = � �  �    Section Name                       =f �  �    Tag Name                         !' �      x    Integer Value                      	                ""    ""       L    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutUInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Adds a tag/unsigned integer pair to the tag/value list identified by <strong>Handle</strong>.  The unsigned integer value is associated with the tag identified by <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;By default, the function checks for and deletes existing items with duplicate names.  You can disable the duplicate checking, and thereby increase performance, by calling <span id="Monospace">Ini_SetDuplicateChecking</span>.</td></tr></table>



</body>
</html>




    X    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutUInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>         <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutUInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to place the tag/value pair.</p>



</body>
</html>

        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutUInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name to use in the tag/value pair.</p>



</body>
</html>

    8    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutUInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
</table>

</body>
</html>    !    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutUInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The unsigned integer value to associate with the Tag Name.</p>



</body>
</html>

   &� =   �  x    Handle                           (" = � �  �    Section Name                     )J =f �  �    Tag Name                         *c���    x    Status                           -� �     x    Unsigned Integer Value                 ""    ""    	               6    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutDouble</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Adds a tag/double pair to the tag/value list identified by <strong>Handle</strong>.  The double value is associated with the tag identified by <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;By default, the function checks for and deletes existing items with duplicate names.  You can disable the duplicate checking, and thereby increase performance, by calling <span id="Monospace">Ini_SetDuplicateChecking</span>.</td></tr></table>

</body>
</html>


    Z    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutDouble</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutDouble</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to place the tag/value pair.</p>

</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutDouble</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name to use in the tag/value pair.</p>

</body>
</html>    :    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutDouble</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
</table>

</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutDouble</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The double value to associate with the Tag Name.</p>

</body>
</html>   33 =   �  x    Handle                           4� = � �  �    Section Name                     5� =f �  �    Tag Name                         6����    x    Status                           : �     x    Double Value                           ""    ""    	               L    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Adds a tag/boolean pair to the tag/value list identified by Handle.  The boolean value is associated with the tag identified by <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.  If the boolean value passed is non-zero, &quot;True&quot; is associated with the tag.  Otherwise, &quot;False&quot; is associated with the tag.</p>

</body>
</html>    [    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to place the tag/value pair.</p>

</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name to use in the tag/value pair.</p>

</body>
</html>    <    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
</table>

</body>
</html>
    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The boolean value to associate with the Tag Name.  
If the value is non-zero, &quot;True&quot; is associated with the Tag Name.  If the value is zero, &quot;False&quot; is associated with the Tag Name.</p>

</body>
</html>   >� =   �  x    Handle                           @ = � �  �    Section Name                     A8 =f �  �    Tag Name                         BP���    x    Status                           E� � C          Boolean Value                          ""    ""    	           True 1 False 0       <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This function stores the specified block of bytes in the tag/value list identified by <strong>Handle</strong>.</p>

<p class="Body">The data block can be any length greater than zero bytes and can contain any byte values.</p>

<p class="Body">The data is associated with the tag identified by <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>

<p class="Body">The bytes in the data block are converted to printable ASCII characters before they are added to the IniText.  <span id="Monospace">Ini_GetData</span> automatically converts the ASCII characters back to their original byte values.</p>

<p class="Body">If the data is very long, the instrument driver will split it across multiple lines associated with the same tag name.  This is done by generating new tag names, such as in:</p>

   <table class="Borderless">
   <tr><td>&lt;Tag Name&gt; Line 0001</td> <td>&#61; &quot;first part of data ........&quot;</td></tr>
   <tr><td>&lt;Tag Name&gt; Line 0002</td> <td>&#61; &quot;second part of data .......&quot;</td></tr>
   <tr><td>&lt;Tag Name&gt; Line 0003</td> <td>&#61; &quot;third part of data&quot;</td></tr></table>
   
<p class="Body">When you attempt to retrieve the data from the file by calling <span id="Monospace">Ini_GetData</span>, you only need to enter the same Tag Name that you passed into this function.  The instrument driver takes care of reconstructing the original single block of data from the  multiple lines.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;By default, the function checks for and deletes existing items with duplicate names.  You can disable the duplicate checking, and thereby increase performance, by calling <span id="Monospace">Ini_SetDuplicateChecking</span>.</td></tr></table>


</body>
</html>    [    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to place the tag/value pair.</p>

</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name to use in the tag/value pair.</p>

</body>
</html>         <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A pointer to the block of bytes to store with the tag name.</p>

</body>
</html>      8    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether the function was successful.</p>

<p class="Body">A zero indicates success.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

    <table class="Borderless-Wide">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
</table>

</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_PutData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The number of bytes to store with the tag name.</p>

</body>
</html>   P� =   �  x    Handle                           R = � �  �    Section Name                     S( =f �  �    Tag Name                         T= �  �  x    Data                             Ue���    x    Status                           X� � �    x    Data Size                              ""    ""        	                   <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetPointerToString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains a pointer to the string associated with <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>

<p class="Body">Do NOT modify the string or attempt to free the pointer.</p>

<p class="Body">The contents pointed to by the pointer are valid only until the next call to<br><br>

    <span id="Monospace">Ini_GetPointerToString</span>,<br> 
     <span id="Monospace">Ini_GetStringCopy</span>, or<br>
    <span id="Monospace">Ini_GetStringIntoBuffer</span><br><br>

on the same in-memory list of tag/value pairs.</p>

</body>
</html>    c    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetPointerToString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    &    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetPointerToString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>

</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetPointerToString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name in the tag/value pair.</p>

</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetPointerToString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether a tag/string pair was found with the specified <strong>Tag Name</strong> in the section specified by <strong>Section Name</strong>.</p>

<p class="Body">A positive return value indicates that a tag/string pair was found.  If the string portion of the tag/string pair was empty, such as in</p> 

<p class="Body">    tag 1 &#61; &quot;&quot;</p>

<p class="Body">the string is considered to have been found, and it is the empty string &#40;&quot;&quot;&#41;.  If the tag's value is empty, such as in </p>

<p class="Body">    tag 1 &#61; </p>

<p class="Body">no tag/value pair is found.</p>

<p class="Body">A zero indicates that no tag/string pair was found.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

<table class="Borderless"><tr><td>&ndash;12</td>  <td>Out of memory!</td></tr></table>
</p>

</body>
</html>    |    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetPointerToString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A pointer variable into which the address of the string associated with <strong>Tag Name</strong> is placed.  Do NOT modify the string or attempt to free the pointer.</p>

<p class="Body">The address of the string will be valid until the next call to <span id="Monospace">Ini_GetPointerToString</span>, <span id="Monospace">Ini_GetStringCopy</span>, <span id="Monospace">Ini_GetStringIntoBuffer</span>, <span id="Monospace">Ini_GetPointerToRawString</span>, Ini_GetRawStringCopy, or <span id="Monospace">Ini_GetRawStringIntoBuffer</span>.</p>

<p class="Body">If an error occurs or the Tag Name cannot be found in the section, the pointer is set to NULL.</p>

</body>
</html>   ^= =   �  x    Handle                           _� = � �  �    Section Name                     `� =f �  �    Tag Name                         a����    x    Status                           gw �f    x    Pointer to String                      ""    ""    	            	           �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringCopy</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains a copy of the string associated with <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>  

<p class="Body">You are responsible for freeing the string.</p>

</body>
</html>
    ^    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringCopy</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    "    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringCopy</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>

</body>
</html>
        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringCopy</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name in the tag/value pair.</p>

</body>
</html>
    |    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringCopy</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether a tag/string pair was found with the specified <strong>Tag Name</strong> in the section specified by <strong>Section Name</strong>.</p>

<p class="Body">A positive return value indicates that a tag/string pair was found.  If the string portion of the tag/string pair was empty, such as in</p> 

<p class="Body">    tag 1 &#61; &quot;&quot;</p>

<p class="Body">the string is considered to have been found, and it is the empty string &#40;&quot;&quot;&#41;.  If the tag's value is empty, such as in </p>

<p class="Body">    tag 1 &#61; </p>

<p class="Body">no tag/value pair is found.</p>

<p class="Body">A zero indicates that no tag/string pair was found.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

<table class="Borderless"><tr><td>&ndash;12</td>  <td>Out of memory!</td></tr></table>
</p>

</body>
</html>
    W    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringCopy</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The pointer variable into which the address of the dynamically allocated copy of the string associated with <strong>Tag Name</strong> is placed.  
You are responsible for freeing the string by calling the <span id="Monospace">free()</span> function.</p>

<p class="Body">If an error occurs or the Tag Name cannot be found in the section, the pointer is set to NULL.</p>

</body>
</html>
   m� =   �  x    Handle                           oI = � �  �    Section Name                     ps =f �  �    Tag Name                         q����    x    Status                           w �f    x    Copy of String                         ""    ""    	            	               <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Copies the string associated with <strong>Tag Name</strong> into <strong>Buffer</strong> in the section identified by <strong>Section Name</strong>.</p>  

<p class="Body"><strong>Buffer</strong> must be able to contain at least as many bytes as indicated by <strong>Buffer Size</strong>.</p>

</body>
</html>
    d    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    (    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>

</body>
</html>
        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name in the tag/value pair.</p>

</body>
</html>
    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether a tag/string pair was found with the specified <strong>Tag Name</strong> in the section specified by <strong>Section Name</strong>.</p>

<p class="Body">A positive return value indicates that a tag/string pair was found.  If the string portion of the tag/string pair was empty, such as in </p>

    <p class="Body">tag 1 &#61; &quot;&quot;</p>

<p class="Body">the string is considered to have been found, and it is the empty string &#40;&quot;&quot;&#41;.  If the tag's value is empty, such as in </p>

    <p class="Body">tag 1 &#61;</p> 

<p class="Body">no tag/value pair is found.</p>

<p class="Body">A zero indicates that no tag/string pair was found.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

    <table class="Borderless"><tr><td>&ndash;12</td>  <td>Out of memory!</td></tr></table>


</body>
</html>
    K    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The buffer into which to copy the string associated with <strong>Tag Name</strong>.  The buffer must be large enough to contain at least as many bytes as specified by <strong>Buffer Size</strong>.</p>

<p class="Body">If an error occurs or the Tag Name cannot be found in the section, the first byte of <strong>Buffer</strong> is set to ASCII NUL.</p>

</body>
</html>
    V    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The maximum number of bytes (including the ASCII NUL byte) to be written into <strong>Buffer</strong>.</p>

</body>
</html>
   |� =   �  x    Handle                           ~  = � �  �    Section Name                     P =f �  �    Tag Name                         �k���    x    Status                           �� � �    x    Buffer                           �H �f     x    Buffer Size                            ""    ""    	            	               �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetPointerToRawString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains a pointer to the string associated with <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>

<p class="Body">Do NOT modify the string or attempt to free the pointer.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;This function is exactly like <span id="Monospace">Ini_GetPointerToString()</span> except that backslash characters in the string are not interpreted as denoting escape codes for unprintable characters.  One possible use for this function is to read a pathname in PC format.  Since PC pathnames contain backslashes and since the escape character used by <span id="Monospace">Ini_GetPointerToString()</span> is also the backslash, you must use <span id="Monospace">Ini_GetPointerToRawString()</span> if you do not want the back slashes in the pathname to be interpreted as escape codes.  This is only an issue if you are using the inifile instrument to read entries that were not created by the <span id="Monospace">Ini_PutString</span> function.  The non&ndash;raw versions of the <span id="Monospace">Ini_GetString</span> functions automatically recognize and remove the escape codes inserted by <span id="Monospace">Ini_PutString()</span>.</td></tr></table>

</body>
</html>    f    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetPointerToRawString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    )    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetPointerToRawString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>

</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetPointerToRawString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name in the tag/value pair.</p>

</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetPointerToRawString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether a tag/string pair was found with the specified <strong>Tag Name</strong> in the section specified by <strong>Section Name</strong>.</p>

<p class="Body">A positive return value indicates that a tag/string pair was found.  If the string portion of the tag/string pair was empty, such as in </p>

    <p class="Body">tag 1 &#61; &quot;&quot;</p>

<p class="Body">the string is considered to have been found, and it is the empty string &#40;&quot;&quot;&#41;.  If the tag's value is empty, such as in </p>

    <p class="Body">tag 1 &#61;</p> 

<p class="Body">no tag/value pair is found.</p>

<p class="Body">A zero indicates that no tag/string pair was found.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

    <table class="Borderless"><tr><td>&ndash;12</td>  <td>Out of memory!</td></tr></table>


</body>
</html>

    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetPointerToRawString</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A pointer variable into which the address of the string associated with <strong>Tag Name</strong> is placed.  Do NOT modify the string or attempt to free the pointer.</p>

<p class="Body">The address of the string will be valid until the next call to <span id="Monospace">Ini_GetPointerToString</span>, <span id="Monospace">Ini_GetStringCopy</span>, <span id="Monospace">Ini_GetStringIntoBuffer</span>, <span id="Monospace">Ini_GetPointerToRawString</span>, <span id="Monospace">Ini_GetRawStringCopy</span>, or <span id="Monospace">Ini_GetRawStringIntoBuffer</span>.</p>

<p class="Body">If an error occurs or the Tag Name cannot be found in the section, the pointer is set to NULL.</p>

</body>
</html>   � =   �  x    Handle                           �� = � �  �    Section Name                     �� =f �  �    Tag Name                         �����    x    Status                           �[ �f    x    Pointer to String                      ""    ""    	            	           �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringCopy</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains a copy of the string associated with <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>  

<p class="Body">You are responsible for freeing the string.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;This function is exactly like <span id="Monospace">Ini_GetStringCopy()</span> except that backslash characters in the string are not interpreted as denoting escape codes for unprintable characters.  One possible use for this function is to read a pathname in PC format.  Since PC pathnames contain backslashes and since the escape character used by <span id="Monospace">Ini_GetStringCopy()</span> is also the backslash, you must use <span id="Monospace">Ini_GetRawStringCopy()</span> if you do not want the back slashes in the pathname to be interpreted as escape codes.  This is only an issue if you are using the inifile instrument to read entries that were not created by the <span id="Monospace">Ini_PutString</span> function.  The non-raw versions of the <span id="Monospace">Ini_GetString</span> functions automatically recognize and remove the escape codes inserted by <span id="Monospace">Ini_PutString()</span>.</td></tr></table>

</body>
</html>


    a    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringCopy</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    &    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringCopy</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>
</body>
</html>


        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringCopy</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name in the tag/value pair.</p>
</body>
</html>



    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringCopy</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether a tag/string pair was found with the specified <strong>Tag Name</strong> in the section specified by <strong>Section Name</strong>.</p>

<p class="Body">A positive return value indicates that a tag/string pair was found.  If the string portion of the tag/string pair was empty, such as in </p>

    <p class="Body">tag 1 &#61; &quot;&quot;</p>

<p class="Body">the string is considered to have been found, and it is the empty string &#40;&quot;&quot;&#41;.  If the tag's value is empty, such as in </p>

    <p class="Body">tag 1 &#61;</p> 

<p class="Body">no tag/value pair is found.</p>

<p class="Body">A zero indicates that no tag/string pair was found.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

    <table class="Borderless"><tr><td>&ndash;12</td>  <td>Out of memory!</td></tr></table>


</body>
</html>


    \    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringCopy</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The pointer variable into which the address of the dynamically allocated copy of the string associated with <strong>Tag Name</strong> is placed.  
You are responsible for freeing the string by calling the <span id="Monospace">free()</span> function.</p>

<p class="Body">If an error occurs or the Tag Name cannot be found in the section, the pointer is set to NULL.</p>

</body>
</html>


   � =   �  x    Handle                           �v = � �  �    Section Name                     �� =f �  �    Tag Name                         �����    x    Status                           �G �f    x    Copy of String                         ""    ""    	            	           O    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Copies the string associated with <strong>Tag Name</strong> into <strong>Buffer</strong> in the section identified by <strong>Section Name</strong>.</p>  

<p class="Body"><strong>Buffer</strong> must be able to contain at least as many bytes as indicated by <strong>Buffer Size</strong>.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;This function is exactly like <span id="Monospace">Ini_GetStringIntoBuffer()</span> except that backslash characters in the string are not interpreted as denoting escape codes for unprintable characters.  One possible use for this function is to read a pathname in PC format.  Since PC pathnames contain backslashes and since the escape character used by <span id="Monospace">Ini_GetStringIntoBuffer()</span> is also the backslash, you must use <span id="Monospace">Ini_GetRawStringIntoBuffer()</span> if you do not want the back slashes in the pathname to be interpreted as escape codes.  This is only an issue if you are using the inifile instrument to read entries that were not created by the <span id="Monospace">Ini_PutString</span> function.  The non&ndash;raw versions of the <span id="Monospace">Ini_GetString</span> functions automatically recognize and remove the escape codes inserted by <span id="Monospace">Ini_PutString()</span>.</td></tr></table>

</body>
</html>


    g    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    -    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>

</body>
</html>


        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name in the tag/value pair.</p>

</body>
</html>



    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether a tag/string pair was found with the specified <strong>Tag Name</strong> in the section specified by <strong>Section Name</strong>.</p>

<p class="Body">A positive return value indicates that a tag/string pair was found.  If the string portion of the tag/string pair was empty, such as in </p>

    <p class="Body">tag 1 &#61; &quot;&quot;</p>

<p class="Body">the string is considered to have been found, and it is the empty string &#40;&quot;&quot;&#41;.  If the tag's value is empty, such as in </p>

    <p class="Body">tag 1 &#61;</p> 

<p class="Body">no tag/value pair is found.</p>

<p class="Body">A zero indicates that no tag/string pair was found.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

    <table class="Borderless"><tr><td>&ndash;12</td>  <td>Out of memory!</td></tr></table>


</body>
</html>


    P    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The buffer into which to copy the string associated with <strong>Tag Name</strong>.  The buffer must be large enough to contain at least as many bytes as specified by <strong>Buffer Size</strong>.</p>

<p class="Body">If an error occurs or the Tag Name cannot be found in the section, the first byte of <strong>Buffer</strong> is set to ASCII NUL.</p>

</body>
</html>


    [    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetRawStringIntoBuffer</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The maximum number of bytes (including the ASCII NUL byte) to be written into <strong>Buffer</strong>.</p>

</body>
</html>


   �3 =   �  x    Handle                           �� = � �  �    Section Name                     �� =f �  �    Tag Name                         �����    x    Status                           �� � �    x    Buffer                           �� �f     x    Buffer Size                            ""    ""    	            	               d    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains the integer value associated with <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>

</body>
</html>


    W    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>

</body>
</html>


    	    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name in the tag/value pair.</p>

</body>
</html>



    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether a valid tag/integer pair was found with the specified <strong>Tag Name</strong> in the section specified by <strong>Section Name</strong>.</p>

<p class="Body">A positive return value indicates that a tag/integer pair was found, and that the integer portion of the pair was a valid ASCII decimal representation of an integer.</p>

<p class="Body">A zero indicates that no tag/integer pair was found, or that the integer portion was empty.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.
</p>

<p class="Body">For this function, the only errors you might encounter are:</p>

<table class="Borderless">
 <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
  <tr><td>&ndash;5021</td>  <td>Invalid integer</td></tr></table>

</body>
</html>


    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The variable into which the integer value associated with <strong>Tag Name</strong> is placed.</p>

<p class="Body">If <strong>Tag Name</strong> cannot be found, or the integer value is empty, or an error occurs, the variable is left untouched.</p>

</body>
</html>


   � =   �  x    Handle                           �w = � �  �    Section Name                     ʜ =f �  �    Tag Name                         ˭���    x    Status                           Ђ �f     x    Integer Value                          ""    ""    	            	           o    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetUInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains the unsigned integer value associated with <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>


</body>
</html>


    X    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetUInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetUInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>


</body>
</html>


    
    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetUInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name in the tag/value pair.</p>


</body>
</html>


        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetUInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether a valid tag/unsigned integer pair was found with the specified <strong>Tag Name</strong> in the section specified by <strong>Section Name</strong>.</p>

<p class="Body">A positive return value indicates that a tag/unsigned integer pair was found, and that the unsigned integer portion of the pair was a valid ASCII decimal representation of an unsigned integer.</p>

<p class="Body">A zero indicates that no tag/unsigned integer pair was found, or that the unsigned integer portion was empty.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only errors you might encounter are:</p>

    <table class="Borderless">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
  <tr><td>&ndash;5022</td>  <td>Invalid unsigned integer</td></tr></table>


</body>
</html>


    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetUInt</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The variable into which the unsigned integer value associated with <strong>Tag Name</strong> is placed.</p>

<p class="Body">If <strong>Tag Name</strong> cannot be found, or the unsigned integer value is empty, or an error occurs, the variable is left untouched.</p>


</body>
</html>


   � =   �  x    Handle                           �k = � �  �    Section Name                     ג =f �  �    Tag Name                         ؤ���    x    Status                           �� �f    x    Unsigned Integer Value                 ""    ""    	            	           f    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetDouble</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains the double value associated with <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>

</body>
</html>


    Z    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetDouble</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>         <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetDouble</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>

</body>
</html>


        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetDouble</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name in the tag/value pair.</p>

</body>
</html>



    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetDouble</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether a valid tag/double pair was found with the specified <strong>Tag Name</strong> in the section specified by <strong>Section Name</strong>.</p>

<p class="Body">A positive return value indicates that a tag/double pair was found, and that the double portion of the pair was a valid ASCII representation of an double&ndash;precision real number.</p>

<p class="Body">A zero indicates that no tag/double pair was found, or that the double portion was empty.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only errors you might encounter are:</p>

<table class="Borderless">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
  <tr><td>&ndash;5023</td>  <td>Invalid double value</td></tr></table>

</body>
</html>


    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetDouble</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The variable into which the double value associated with <strong>Tag Name</strong> is placed.</p>

<p class="Body">If <strong>Tag Name</strong> cannot be found, or the double value is empty, or an error occurs, the variable is left untouched.</p>

</body>
</html>


   �T =   �  x    Handle                           � = � �  �    Section Name                     �� =f �  �    Tag Name                         �����    x    Status                           �� �f    x    Double Value                           ""    ""    	            	          h    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains the boolean value associated with <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>

</body>
</html>


    [    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    !    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>

</body>
</html>


        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name in the tag/value pair.</p>

</body>
</html>



    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether a valid tag/boolean pair was found with the specified <strong>Tag Name</strong> in the section specified by <strong>Section Name</strong>.</p>

<p class="Body">A positive return value indicates that a tag/boolean pair was found, and that the boolean portion of the pair was one of the valid boolean representations.</p>

<p class="Body">A zero indicates that no tag/boolean pair was found, or that the boolean portion was empty.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only errors you might encounter are:</p>

 <table class="Borderless">
    <tr><td>&ndash;12</td>  <td>Out of memory!</td></tr>
  <tr><td>&ndash;5024</td>  <td>Invalid boolean</td></tr></table>
  
  
</body>
</html>


    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetBoolean</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The variable into which the boolean value associated with <strong>Tag Name</strong> is placed.  If the boolean value is &quot;True&quot;, a 1 is placed in the variable.  If the boolean value is &quot;False&quot;, a 0 is placed in the variable.</p>

<p class="Body">If <strong>Tag Name</strong> cannot be found, or the value is not a valid boolean representation, or an error occurs, the variable is left untouched.</p>

</body>
</html>


   �b =   �  x    Handle                           �� = � �  �    Section Name                     �� =f �  �    Tag Name                         ����    x    Status                           �� �f     x    Boolean Value                          ""    ""    	            	           �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains a copy of the data block associated with <strong>Tag Name</strong> in the section identified by <strong>Section Name</strong>.</p>  

<p class="Body">You are responsible for freeing the data.</p>

  
</body>
</html>


    X    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    !    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>

  
</body>
</html>


        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name in the tag/value pair.</p>

  
</body>
</html>



    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates whether a tag/data pair was found with the specified <strong>Tag Name</strong> in the section specified by <strong>Section Name</strong>.</p>

<p class="Body">A positive return value indicates that a tag/data pair was found.</p>

<p class="Body">If the tag's value is empty, such as in </p>

    <p class="Body">tag 1 &#61; </p>

<p class="Body">no tag/value pair is found.</p>

<p class="Body">A zero indicates that no tag/data pair was found.</p>

<p class="Body">A negative value indicates an error.  If the value is from
&ndash;1 to &ndash;999, it is one of the error values defined in <span id="Monospace">userint.h</span>.  If the value is from &ndash;5000 to &ndash;5999, it is one of the error values defined in <span id="Monospace">toolbox.h</span>.</p>

<p class="Body">For this function, the only error you are likely to encounter is:</p>

 <table class="Borderless"><tr>   <td>&ndash;12</td>  <td>Out of memory!</td></tr></table>


  
</body>
</html>


    P    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The pointer variable into which the address of a dynamically allocated copy of the data associated with <strong>Tag Name</strong> is placed.  
You are responsible for freeing the data by calling the <span id="Monospace">free()</span> function.</p>

<p class="Body">If an error occurs or the Tag Name cannot be found in the section, the pointer is set to NULL.</p>

  
</body>
</html>


    r    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_GetData</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Returns the size of the data in bytes.</p>

<p class="Body">You may pass 0 (NULL) for this parameter if you do not need this information.</p>

  
</body>
</html>


   �R =   �  x    Handle                           �� = � �  �    Section Name                     �� =f �  �    Tag Name                          ����    x    Status                           � � � �  x    Data                             � �f    x    Data Size                              ""    ""    	            	           	           z    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SectionExists</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Determines if the section specified by <strong>Section Name</strong> exists in the list of tag/value pairs specified by <strong>Handle</strong>.</p>

</body>
</html>
    ^    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SectionExists</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    (    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SectionExists</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The name of the section, the existence of which is determined.</p>

</body>
</html>
    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_SectionExists</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates if the section specified by <strong>Section Name</strong> exists in the list of tag/value pairs specified by <strong>Handle</strong>.</p>

<p class="Body">If the section exists, a 1 is returned.</p>

<p class="Body">If the section does not exist, a 0 is returned.</p>

</body>
</html>   [ =   �  x    Handle                           � = � �  �    Section Name                     ����    x    Section Exists                         ""    	           L    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NumberOfSections</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Returns the number of sections in the tag/value pair list identified by <strong>Handle</strong>.</p>

</body>
</html>    a    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NumberOfSections</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    D    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NumberOfSections</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The number of sections in the tag/value pair list identified by <strong>Handle</strong>.</p>

</body>
</html>   � =   �  x    Handle                           e���    x    Number of Sections                     	           �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NthSectionName</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains a pointer to name of the section specified by the 1&ndash;based index in <strong>Section Index</strong>.</p>  

<p class="Body">Do NOT modify the section name or attempt to free the pointer.</p>


</body>
</html>    e    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NthSectionName</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">If there is a section corresponding to the specified index, 
1 is returned.</p>

<p class="Body">Otherwise, 0 is returned.</p>


</body>
</html>    _    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NthSectionName</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    S    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NthSectionName</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A 1&ndash;based index into the list sections in the tag/value list specified by <strong>Handle</strong>.</p>


</body>
</html>    d    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NthSectionName</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A pointer variable into which the address of the section name is placed.  Do NOT modify the section name or attempt to free the pointer.</p>

<p class="Body">The pointer is valid until the next time the list of in&ndash;memory tag/value pairs is modified.</p>

<p class="Body">If there is no section corresponding to the specified index, the pointer variable is left untouched.</p>


</body>
</html>   ����    x    Section Found?                   Q = =  �  x    Handle                           � = �     x    Section Index                     =y    x    Section Name Pointer               	                1    	           �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ItemExists</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Determines if the item specified by <strong>Tag Name</strong> exists in the section identified by <strong>Section Name</strong>, or if there are items having tag names of the form<br><br>

     &lt;Tag Name&gt; Line 0001<br>
     &lt;Tag Name&gt; Line 0002<br>
     &lt;Tag Name&gt; Line 0003<br><br>

in the section identified by <strong>Section Name</strong>.  The latter case indicates that the item specified by <strong>Tag Name</strong> was split across several lines.</p>


<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;This function should be used instead of the obsoleted function <span id="Monospace">Ini_ItemOrMultiLineItemExists</span>.
</td></tr></table>

</body>
</html>    [    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ItemExists</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ItemExists</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>

</body>
</html>    	    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ItemExists</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name in the tag/value pair.</p>

</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_ItemExists</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates if the item specified by <strong>Tag Name</strong> exists in the section identified by <strong>Section Name</strong>.</p>

<p class="Body">If the item exists, a 1 is returned.</p>

<p class="Body">If the item exists, a 0 is returned.</p>

</body>
</html>   #@ 3 !  �  x    Handle                           $� 3 � �  �    Section Name                     %� 3` �  �    Tag Name                         &����    x    Item Exists                            ""    ""    	               <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NumberOfItems</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains the number of items in the section identified by Section Name.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;If an item was split across several lines, it has several tag names entries in the <span id="Monospace">.ini</span> file, as in the following.<br><br>

     &lt;Tag Name&gt; Line 0001<br>
     &lt;Tag Name&gt; Line 0002<br>
     &lt;Tag Name&gt; Line 0003<br><br>

For the purposes of this function, the group of tag names counts as only one item.</td></tr></table>
</body>
</html>


    ^    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NumberOfItems</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    '    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NumberOfItems</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The name of the section under which the item count is returned.</p>
</body>
</html>    z    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NumberOfItems</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The number of items in the section identified by <strong>Section Name</strong>.</p>

<p class="Body">If the section does not exist, 0 is returned.</p>
</body>
</html>   ,� 9 %  �  x    Handle                           ./ : � �  �    Section Name                     /^���    x    Number of Items                        ""    	           �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NthItemName</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains a pointer to the tag name of the tag/value pair specified by the 1&ndash;based index in <strong>Item Index</strong>, within the section identified by <strong>Section Name</strong>.</p>

<p class="Body">Do NOT modify the tag name or attempt to free the pointer.</p>

<table class="Borderless-Wide">
<tr>
<td class="Icon"><img src="note.gif"></td>
<td>
<strong>Note</strong>&nbsp;&nbsp;If the item was split across several lines, it has several tag names entries in the <span id="Monospace">.ini</span> file, as in the following.<br><br>

     &lt;Tag Name&gt; Line 0001<br>
     &lt;Tag Name&gt; Line 0002<br>
     &lt;Tag Name&gt; Line 0003<br><br>

For the purposes of this function, the group of tag names counts as only one item with the name of &lt;Tag Name&gt;.</td></tr></table>

</body>
</html>

    \    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NthItemName</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NthItemName</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The section name under which to find the tag/value pair.</p>
</body>
</html>    n    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NthItemName</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A pointer variable into which the address of the tag name is placed.  Do NOT modify the tag name or attempt to free the pointer.</p>

<p class="Body">The pointer is valid until the next time the list of in&ndash;memory tag/value pairs is modified.</p>

<p class="Body">If there is no tag/value pair corresponding to the specified index in the section, the pointer variable is left untouched.</p>

</body>
</html>    a    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NthItemName</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">If there is a section corresponding to the specified index, 
1 is returned.</p>

<p class="Body">Otherwise, 0 is returned.</p>

</body>
</html>    V    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_NthItemName</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A 1&ndash;based index into the list tag/value pairs in the section identified by <strong>Section Name</strong>.</p>

</body>
</html>   5� 2 2  �  x    Handle                           6� 2 � �  �    Section Name                     8$ ��    x    Item Tag Name Pointer            :����    x    Item Found?                      < 4}     x    Item Index                             ""    	            	            1   '    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_LineOfLastAccess</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Obtains the 1&ndash;based index of the line of the file the was the source of the last tag/value pair accessed by one of the <span id="Monospace">Ini_Get</span>... functions.</p>

<p class="Body">This information can be useful when reporting an error while processing an <span id="Monospace">.ini</span> style file.</p>

</body>
</html>    a    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_LineOfLastAccess</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_LineOfLastAccess</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The 1&ndash;based index of the line of the file the was the source of the last tag/value pair accessed by one of the <span id="Monospace">Ini_Get</span>... functions.</p>

</body>
</html>   @� B �  �  x    Handle                           B)���    x    Line Number                            	           O    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_RemoveSection</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This function removes a section and all of its items from the list of in&ndash;memory tag/value pairs.</p>

</body>
</html>    ^    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_RemoveSection</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_RemoveSection</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The name of the section to remove.</p>

</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_RemoveSection</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates if the section specified by <strong>Section Name</strong> was removed from the tag/value pairs specified by <strong>Handle</strong>.</p>

<p class="Body">If the section was removed, a 1 is returned.</p>

<p class="Body">If the section was not found, a 0 is returned.</p>
</body>
</html>   E� 3 (  �  x    Handle                           F� 3 � �  �    Section Name                     H���    x    Result                                 ""    	           �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_RemoveItem</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">This function removes an item from the list of in&ndash;memory tag/value pairs. If the item is a string that was split into multiple lines, then all of the lines are removed.</p>


</body>
</html>    [    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_RemoveItem</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">A handle returned from <span id="Monospace">Ini_New</span>.  It represents the list of in-memory tag/value pairs.</p>





</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_RemoveItem</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The name of the section containing the item to remove.</p>


</body>
</html>    �    <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_RemoveItem</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">Indicates if the specified item was removed from the tag/value pairs specified by <strong>Handle</strong>.</p>

<p class="Body">If the item was removed, a 1 is returned.</p>

<p class="Body">If the item was not found, a 0 is returned.</p>


</body>
</html>        <html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>Ini_RemoveItem</title>
<LINK REL="StyleSheet" HREF="styles.css" type="text/css">
</head>

<body>
<p class="Body">The tag name of the tag/value pair to remove.</p>


</body>
</html>   Lc 3   �  x    Handle                           M� 3 � �  �    Section Name                     N����    x    Result                           P� 3x �  �    Tag Name                               ""    	            "" ����         '�  5�     K.    New                             ����         7�  :�     K.    Dispose                         ����         :�  A�     K.    Sort                            ����         A�  Gx     K.    DisableSorting                  ����         G�  Sa     K.    SortInternally                  ����         S�  Y�     K.    DisableInternalSorting          ����         Z  e�     K.    WriteToFile                     ����         f�  q:     K.    ReadFromFile                    ����         q�  �     K.    WriteToRegistry                 ����         ��  �     K.    ReadFromRegistry                ����         ��  ��     K.    WriteGeneric                    ����         ��  ��     K.    ReadGeneric                     ����         ��  �p     K.    CopySection                     ����         ͠  ��     K.    SetTokens                       ����         �d  �     K.    SetSectionFilter                ����         �   �     K.    SetDuplicateChecking            ����         �g K     K.    PutString                       ����        v �     K.    PutRawString                    ����         "E     K.    PutInt                          ����        #n .�     K.    PutUInt                         ����        /� ;1     K.    PutDouble                       ����        <Z GK     K.    PutBoolean                      ����        H� Y�     K.    PutData                         ����        [! j�     K.    GetPointerToString              ����        l, yk     K.    GetStringCopy                   ����        z� ��     K.    GetStringIntoBuffer             ����        � ��     K.    GetPointerToRawString           ����        �/ ��     K.    GetRawStringCopy                ����        �� �B     K.    GetRawStringIntoBuffer          ����        Ƭ �c     K.    GetInt                          ����        Ӕ ߵ     K.    GetUInt                         ����        �� ��     K.    GetDouble                       ����        �� �i     K.    GetBoolean                      ����        �� 	g     K.    GetData                         ����        
� �     K.    SectionExists                   ����        � �     K.    NumberOfSections                ����        +      K.    NthSectionName                  ����        t (�     K.    ItemExists                      ����        )� 0�     K.    NumberOfItems                   ����        1� =a     K.    NthItemName                     ����        >� C�     K.    LineOfLastAccess                ����        D= J     K.    RemoveSection                   ����        J� Q�     K.    RemoveItem                            T                                    �Management                           DNew In-Memory Object                 DDispose In-Memory Object             DSort                                 DDisable Sorting                      DSort (Internally)                    DDisable Sorting (Internally)         DWrite To File                        DRead From File                       DWrite To Registry                    DRead From Registry                   DWrite To Generic Destination         DRead From Generic Source             DCopy Section                         DSet Tokens                           DSet Section Filter                   DSet Duplicate Checking              "bPutting Tag/Value Pairs              DPut String                           DPut Raw String                       DPut Integer                          DPut Unsigned Integer                 DPut Double                           DPut Boolean                          DPut Data                            #�Getting Values from Tags             DGet Pointer To String                DGet Copy Of String                   DGet String Into Buffer               DGet Pointer To Raw String            DGet Copy Of Raw String               DGet Raw String Into Buffer           DGet Integer                          DGet Unsigned Integer                 DGet Double                           DGet Boolean                          DGet Data                            %Informational                        DSection Exists?                      DNumber of Sections                   DNth Section Name                     DItem Exists?                         DNumber of Items                      DNth Item Name                        DLine Of Last Access                 &PRemoving Sections and Items          DRemove Section                       DRemove Item                           toolbox.fp 