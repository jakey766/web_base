package com.pk;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class PoiTest {
	
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
	
	public static void main(String[] args) throws Exception {
		readExcel();
	}
	
	private static void readExcel() throws Exception{
		File file = new File("F:\\XW\\BYD\\CM\\系统基础信息测试数据2016.9.28.xlsx");
		XSSFWorkbook xwb = new XSSFWorkbook(new FileInputStream(file));
		XSSFSheet sheet = xwb.getSheetAt(0);
		XSSFRow row = null;
		XSSFCell cell = null;
		int firstRow = sheet.getFirstRowNum();
		int rows = sheet.getPhysicalNumberOfRows();
		Object val = null;
		for (int i = firstRow; i < rows; i++) {
			row = sheet.getRow(i);
			if (row == null)
				continue;
			for (int j = row.getFirstCellNum(), len = row.getLastCellNum(); j < len; j++) {
				cell = row.getCell(j);
				int ctype = cell.getCellType();
				if (ctype == XSSFCell.CELL_TYPE_STRING) {
					val = cell.getStringCellValue();
				} else if (ctype == XSSFCell.CELL_TYPE_NUMERIC) { // 数字
					if (HSSFDateUtil.isCellDateFormatted(cell)) { // 日期
						Date date = HSSFDateUtil.getJavaDate(cell.getNumericCellValue());
						val = DATE_FORMAT.format(date);
					} else {
						val = cell.getNumericCellValue();
					}
				} else if (ctype == XSSFCell.CELL_TYPE_FORMULA) { // 公式
					double numericValue = cell.getNumericCellValue(); // 公式结果
					if (HSSFDateUtil.isValidExcelDate(numericValue)) { // 日期类型
						val = DATE_FORMAT.format(cell.getDateCellValue());
					} else {
						val = String.valueOf(numericValue);
					}
				} else if (ctype == XSSFCell.CELL_TYPE_BOOLEAN) {
					val = cell.getBooleanCellValue();
				} else if (ctype == XSSFCell.CELL_TYPE_BLANK) {
					val = "";
				} else {
					val = cell.toString();
				}
				System.out.print(val);
				System.out.print("\t");
			}
			System.out.println();
		}
	}
	
}
