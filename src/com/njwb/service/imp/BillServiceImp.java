package com.njwb.service.imp;

import java.util.List;

import com.njwb.dao.BillDao;
import com.njwb.dao.DeptDao;
import com.njwb.dao.EmpDao;
import com.njwb.entity.Bill;
import com.njwb.entity.Dept;
import com.njwb.entity.Emp;
import com.njwb.service.BillService;

public class BillServiceImp implements BillService {

	BillDao billDao;
	EmpDao empDao;
	DeptDao deptDao;

	public EmpDao getEmpDao() {
		return empDao;
	}

	public void setEmpDao(EmpDao empDao) {
		this.empDao = empDao;
	}

	public DeptDao getDeptDao() {
		return deptDao;
	}

	public void setDeptDao(DeptDao deptDao) {
		this.deptDao = deptDao;
	}

	public BillDao getBillDao() {
		return billDao;
	}

	public void setBillDao(BillDao billDao) {
		this.billDao = billDao;
	}

	public boolean AddBill(Bill bill) {

		// System.out.println(bill +
		// "-----------------------------------------------------------------------");
		//		
		// System.out.println(bill.getBillEmpNo() +
		// "================++++++++++++++++++++++++++++++++++");;

		Emp emp = empDao.queryEmpByEmpNo(bill.getBillEmpNo());

		// System.out.println(emp + "=========================");

		Dept dept = deptDao.queryByDeptNo(emp.getEmpDeptNo());
		//		
		//		
		bill.setBillDeptNo(dept.getDeptNo());
		bill.setBillDeptName(dept.getDeptName());
		//		
		bill.setBillEmpName(emp.getEmpName());

		return billDao.AddBill(bill);
	}

	public boolean deleteBillByBillNo(Integer billNo) {
		// TODO Auto-generated method stub
		return billDao.deleteBillByBillNo(billNo);
	}

	public List<Bill> queryAccessBill() {
		// TODO Auto-generated method stub
		return billDao.queryAccessBill();
	}

	public List<Bill> queryAllBill() {
		// TODO Auto-generated method stub
		return billDao.queryAllBill();
	}

	public boolean ModifyBillByBillNo(Bill bill) {

		Emp emp = empDao.queryEmpByEmpNo(bill.getBillEmpNo());

		// System.out.println(emp + "=========================");

		Dept dept = deptDao.queryByDeptNo(emp.getEmpDeptNo());
		//		
		//		
		bill.setBillDeptNo(dept.getDeptNo());
		bill.setBillDeptName(dept.getDeptName());
		//		
		bill.setBillEmpName(emp.getEmpName());
		// TODO Auto-generated method stub
		return billDao.ModifyBillByBillNo(bill);
	}

	public Bill queryBillBYBillNo(Integer billNo) {
		// TODO Auto-generated method stub
		return billDao.queryBillBYBillNo(billNo);
	}

}
