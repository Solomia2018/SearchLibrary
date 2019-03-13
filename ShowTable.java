import javax.swing.*;

import javax.swing.table.TableColumn;

import java.awt.*;
import java.util.ArrayList;
@SuppressWarnings({ "rawtypes","serial" })
public class ShowTable extends JFrame {
   public ModelTable  dbm;
    private JTable table;
    private JButton init;
    private ArrayList data;
     Class[] types;
    String[] names;
    ShowTable(Class[] type,String[] name) {
    	types=type;
    	names=name;
    	initialize();
    init.addActionListener(e -> {
       dbm.setDataSource(data,names,types);
});
    	   setTableStructure();
    	   setColumnWidth();
    }
    private void initialize() {
        setTitle("Рейтинг");
        dbm = new ModelTable();
        table = new JTable(dbm);
        JScrollPane forTable = new JScrollPane(table);
        getContentPane().add(forTable, BorderLayout.CENTER);
        getContentPane()
        .add(forTable, BorderLayout.CENTER);
    JPanel buttons = new JPanel();
    init = new JButton("Обновити");
    getContentPane()
        .add(buttons, BorderLayout.SOUTH);
    buttons.setLayout
        (new  BoxLayout(buttons,BoxLayout.X_AXIS)); 
    buttons.add(Box.createGlue());
    buttons.add(init);
    buttons.add(Box.createGlue());
     }
    private void setTableStructure() {

      dbm.setDataSource(data,names,types);
    }	
    	   private void setColumnWidth() {
    	        TableColumn column = null;
    	        System.out.println("Name "+names.length);
    	        for (int i = 0; i< names.length-1; i++) {
    	        	System.out.println(i+" "+table.getColumnCount());
    	          column = table
    	           .getColumnModel().getColumn(i);
    	          column
    	           .setPreferredWidth(305/names.length); 
    	       }     
    	   }
    	}

