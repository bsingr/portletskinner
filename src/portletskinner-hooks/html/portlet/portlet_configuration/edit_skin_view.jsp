<%
/**
 *
 * Liferay Portletskinner
 *
 * Copyright (c) 2010 dpree.
 *
 */
%>

<br/>

<div style="border: 1px solid #ccc; background: #fff; margin: 10px; padding: 30px;">
	
<div class="portlet-boundary portlet-boundary_86_  portlet-configuration" id="portletskinner-previewbox">
	<a id="p_86"></a>
 	<div class="<%= skin %>" id='portletskinner-previewbox-class'>
		<div id="portlet-wrapper-86" class="portlet">
			<div class="portlet-topper">
				<span class="portlet-title" style="cursor: move;">
					<span><img title="Sign In" alt="Sign In" src="/html/icons/default.png" class="icon"></span>
				 	PREVIEW SKIN
				  <span class="portletskinner-preview-unsaved" style="display: none; color: red;">
					*
					</span>
				</span>
				<div id="portlet-small-icon-bar_86" class="portlet-icons">
					<!--
					<a class="portlet-icon-back" href="<%= returnToFullPageURL.toString() %>">Return to Full Page</a>
					<script type="text/javascript">
					  jQuery(document).ready(function(){
							jQuery('.portlet-icon-back').bind("click", function(){
								window.location = jQuery(this).attr('href');
								return false;
							});
					  });
					</script>
					-->
				</div>
			</div>
			<div class="portlet-content">
				<div style="" class="portlet-content-container">

<% if ( colorschemes.size() == 0 ) { %>
  <span style="color: orangered;">
		WARNING: the active liferay-theme doesn't inlcude any colorscheme, so you won't be able to specify a skin for this portlet.
		<br/>(mention: portletskinner are based on colorschemes)
	</span>
<% } %>

<% if (!skin.equals(oldSkin)) { %>
<p>Changed skin: "<%= skin %>" (was: "<%= oldSkin %>")</p>
<% } %>

<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery('#portletskinner-selector').change(function(){
		var skin = jQuery(this).val();
		jQuery('#portletskinner-previewbox-class').attr("class","").addClass(skin);
		jQuery(".portletskinner-preview-unsaved").show();
	});
	jQuery('#portletskinner-form').submit(function(){
		var skin = jQuery("#portletskinner-selector").val();
		var oldUrlWithoutSetSkin = window.location.href.replace(/&(|portletskinner-setSkin=.*)$/, "");
		window.location = oldUrlWithoutSetSkin + "&portletskinner-setSkin=" + skin;
		return false;
	});
});
</script>
<form id='portletskinner-form'>
	<table class="lfr-table">
		<tr>
		  <td>
				 Choose portlet skin:
			</td>
			<td>
		    <select id="portletskinner-selector">
	         <option <%= Validator.isNull(skin) ? "selected" : ""%> value=""><liferay-ui:message key="default"/></option>
	         <% while (colorschemesIter.hasNext()) { %>
		          <% ColorScheme cs = colorschemesIter.next(); %>
		          <% String csName = theme.getName() + "::" + cs.getName(); %>
		          <% String csCssClass = cs.getCssClass(); %>
							<option <%= csCssClass.equals(skin) ? "selected='selected'" : ""%> value="<%= csCssClass %>"><%= csName %></option>
	         <% } %>
		    </select>
	   </td>	   
   </tr>
  </table>
  <input type="submit" value='Set Skin'/>
</form>
<br/>
<span class="portletskinner-preview-unsaved" style="display: none; color: red;">
*WARNING: skin has not yet been saved!
</span>

				</div>
			</div>
			<div class="portlet-footer">	<div class="portlet-footer-left"> </div></div>
		</div>
	</div>
</div>

</div>