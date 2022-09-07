package com.kh.jdbc.vo;
import java.sql.Date;
// EMP Table 에 대한 VO
public class EmpVO {

        private int empNO; // 사원 번호
        private String name; // 사원 이름
        private String job; // 사원 직책
        private int mgr; // 상사 번호
        private Date date; // 입사일
        private double sal; // 급여
        private double comm; // 인센티브
        private int deptNO; // 부서 번호

    public EmpVO(int empNO, String name, String job, int mgr, Date date, double sal, double comm, int deptNO) {
        this.empNO = empNO;
        this.name = name;
        this.job = job;
        this.mgr = mgr;
        this.date = date;
        this.sal = sal;
        this.comm = comm;
        this.deptNO = deptNO;
    }

    public int getEmpNO() {
            return empNO;
        }

        public void setEmpNO(int empNO) {
            this.empNO = empNO;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getJob() {
            return job;
        }

        public void setJob(String job) {
            this.job = job;
        }

        public int getMgr() {
            return mgr;
        }

        public void setMgr(int mgr) {
            this.mgr = mgr;
        }

        public Date getDate() {
            return date;
        }

        public void setDate(Date date) {
            this.date = date;
        }

        public double getSal() {
            return sal;
        }

        public void setSal(double sal) {
            this.sal = sal;
        }

        public double getComm() {
            return comm;
        }

        public void setComm(double comm) {
            this.comm = comm;
        }

        public int getDeptNO() {
            return deptNO;
        }

        public void setDeptNO(int deptNO) {
            this.deptNO = deptNO;
        }
}

