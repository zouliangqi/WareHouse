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

import com.yourcompany.struts.bean.SuppliersInfotable;
import com.yourcompany.struts.dao.GoodsInfoDao;
import com.yourcompany.struts.dao.SuppliersInfoDao;
import com.yourcompany.struts.form.SupplierForm;

/** 
 * MyEclipse Struts
 * Creation date: 07-20-2010
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class SupplierAction extends DispatchAction {
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
	public ActionForward queryAllSupplier(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		SuppliersInfoDao userDao = new SuppliersInfoDao();
			ArrayList al = userDao.queryUser();
			request.setAttribute("al", al);
			userDao =null;
			return mapping.findForward("queryAllSupplier");
		}
	public ActionForward addSupplier(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		SuppliersInfoDao userDao = new SuppliersInfoDao();
		SupplierForm userForm = (SupplierForm)form;
		String suppliersId=userForm.getSuppliersId();
		String suppliersName=userForm.getSuppliersName();
		String suppliersChargePerson=userForm.getSuppliersChargePerson();
		String suppliersLocation=userForm.getSuppliersLocation();
		String suppliersTel=userForm.getSuppliersTel();
		String suppliersEmail=userForm.getSuppliersEmail();
		SuppliersInfotable u = new SuppliersInfotable(suppliersId,suppliersName,suppliersChargePerson,suppliersLocation,suppliersTel,suppliersEmail);
		userDao.addSupplier(u);
		return mapping.findForward("addSupplier");	
	}
	
	public ActionForward delSupplier(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String SuppliersId= request.getParameter("suppliersId");
		
		SuppliersInfoDao userDao = new SuppliersInfoDao();
		boolean b = userDao.del(SuppliersId);
		System.out.println("++++++++");
		if (b){
			return mapping.findForward("delSupplier");
		}
		return null;
	}
	
}