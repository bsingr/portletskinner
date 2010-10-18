<%
/**
 *
 * Liferay Portletskinner
 *
 * Copyright (c) 2010 dpree.
 *
 */
%>
<%

// prerequesites

// fetch theme and colorschemes from liferay-look-and-feel.xml
//Theme theme = themeDisplay.getTheme();
List<ColorScheme> colorschemes = (List<ColorScheme>) theme.getColorSchemes();
Iterator<ColorScheme> colorschemesIter = colorschemes.iterator();

//String portletResource = ParamUtil.getString(request, "portletResource");
PortletPreferences preferences = PortletPreferencesFactoryUtil.getLayoutPortletSetup(layout, portletResource);

// retrieve skin from URL and update preferences if necessary
String oldSkin = preferences.getValue("portletskinner-skin", StringPool.BLANK);
String skin = ParamUtil.get(request, "portletskinner-setSkin", oldSkin);
if (skin == null) {
	skin = oldSkin;
}
if (!skin.equals(oldSkin)) {
  preferences.setValue("portletskinner-skin", skin);
  preferences.store();
}

// return URL
String returnToFullPageURL = ParamUtil.getString(request, "returnToFullPageURL");

// portlet title
//Portlet portlet = PortletLocalServiceUtil.getPortletById(company.getCompanyId(), portletResource);
//String portletTitle = portlet.getPortletName();

%>