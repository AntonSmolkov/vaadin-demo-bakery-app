package com.kiroule.vaadin.bakeryapp.ui.views.dashboard;

import com.vaadin.annotations.AutoGenerated;
import com.vaadin.testbench.elements.AbstractComponentElement;
import com.vaadin.testbench.elements.VerticalLayoutElement;
import com.vaadin.testbench.elementsbase.ServerClass;

@ServerClass("com.kiroule.vaadin.bakeryapp.ui.views.dashboard.DashboardViewDesign")
@AutoGenerated
public class DashboardViewDesignElement extends VerticalLayoutElement {

	public AbstractComponentElement getBoard() {
		return $(com.vaadin.testbench.elements.AbstractComponentElement.class).id("board");
	}
}