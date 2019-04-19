package com.yourcompany.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StyledEditorKit.BoldAction;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.yourcompany.struts.bean.EmployeeInfotable;
import com.yourcompany.struts.dao.EmployeeInfoDao;
import com.yourcompany.struts.form.LoginForm;

public class RegisterAction extends Action{
	
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
		public ActionForward execute(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
			
			EmployeeInfotable employee=new EmployeeInfotable();
			LoginForm loginForm=(LoginForm) form;
			employee.setEmployeeId(loginForm.getEmployeeId());
			employee.setEmployeeName(loginForm.getEmployeeName());
			employee.setPassword(loginForm.getPassword());
			employee.setDepartment(loginForm.getDepartment());
			employee.setEmployeeTel(loginForm.getEmployeeTel());
			employee.setEmployeeEmail(loginForm.getEmployeeEmail());
			
			EmployeeInfoDao emdao = new EmployeeInfoDao();
			
			try
			{
				boolean bool = emdao.register(employee);
				
				if (bool==true)
				{
					return mapping.findForward("scs");
				}
				else
				{
					return mapping.findForward("error");
				}
		}
		catch(Exception e)
		{
				e.printStackTrace();
			}
			
			return null;
		}
	
}
