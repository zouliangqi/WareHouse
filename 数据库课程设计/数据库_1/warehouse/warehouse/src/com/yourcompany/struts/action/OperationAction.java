/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.yourcompany.struts.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.yourcompany.struts.dao.OperaterecordDao;

/** 
 * MyEclipse Struts
 * Creation date: 07-22-2010
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class OperationAction extends DispatchAction {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward alloperation(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
		
		OperaterecordDao goods=new OperaterecordDao();
        ArrayList al = goods.allop();
		request.setAttribute("al", al);
	    return mapping.findForward("alloperation");
	}
	
	public ActionForward allexception(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
		
		OperaterecordDao goods=new OperaterecordDao();
        ArrayList al = goods.allexception();
		request.setAttribute("al", al);
	    return mapping.findForward("allexception");
	}
	
}