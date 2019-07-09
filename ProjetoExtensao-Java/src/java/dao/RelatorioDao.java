package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Relatorio;

public class RelatorioDao {
    
    private Connection con = null;
    
    public RelatorioDao() {
        con = Conexao.getConnection();
    }
    
    public void salvarRel(Relatorio relatorio){
        String sql = "INSERT INTO relatorio(atividadeRel, dataRel, fkProj) VALUE(?, ?, ?)";
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, relatorio.getAtividadeRel());
            stmt.setString(2, relatorio.getDataRel());
            stmt.setInt(3, relatorio.getFkProjeto());
            
            stmt.execute();
            
        } catch (SQLException ex) {
            throw new RuntimeException("Erro 5: " + ex);
        }finally{
            Conexao.closeConnection(con, stmt);
        }
    }
    
    public ArrayList<Relatorio> detalhesRelatorio(int valor){
        String sql = "SELECT * FROM relatorio WHERE idRel=" + valor;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        ArrayList<Relatorio> relatorios = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            while(rs.next()){
                Relatorio rel = new Relatorio();
                
                rel.setIdRel(rs.getInt("idRel"));
                rel.setAtividadeRel(rs.getString("atividadeRel"));
                rel.setDataRel(rs.getString("dataRel"));
                rel.setFkProjeto(rs.getInt("fkProj"));
               
                relatorios.add(rel);
            }
            
        } catch (SQLException ex) {
            throw new RuntimeException("Erro 10: " + ex);
        }finally{
            Conexao.closeConnection(con, stmt, rs);
        }
        return relatorios;
    }
    
    public ArrayList<Relatorio> listarRelatorios(int valor){
        String sql = "SELECT * FROM relatorio WHERE fkProj=" + valor;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        ArrayList<Relatorio> relatorios = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            while(rs.next()){
                Relatorio rel = new Relatorio();
                
                rel.setIdRel(rs.getInt("idRel"));
                rel.setAtividadeRel(rs.getString("atividadeRel"));
                rel.setDataRel(rs.getString("dataRel"));
                rel.setFkProjeto(rs.getInt("fkProj"));
               
                relatorios.add(rel);
            }
            
        } catch (SQLException ex) {
            throw new RuntimeException("Erro 7: " + ex);
        }finally{
            Conexao.closeConnection(con, stmt, rs);
        }
        return relatorios;
    }
    
    public void alterarRelatorio(Relatorio relatorio){
        String sql = "UPDATE relatorio SET atividadeRel = ?, dataRel = ? WHERE idRel = ? ";
        PreparedStatement stmt = null;       
        
        try {
            stmt = con.prepareStatement(sql);
            
            stmt.setString(1, relatorio.getAtividadeRel());
            stmt.setString(2, relatorio.getDataRel());
            stmt.setInt(3, relatorio.getIdRel());
            
            stmt.execute();
            
        } catch (SQLException ex) {
            throw new RuntimeException("Erro 9: " + ex);
        }finally{
            Conexao.closeConnection(con, stmt);
        }
    }
    
    public void deleterRelatorio(int valor){
        String sql = "DELETE FROM relatorio WHERE idRel="+valor;
        Statement stmt = null;
        
        try{
            stmt = con.createStatement();
            stmt.execute(sql);
            stmt.close();
            
        }catch(SQLException error){
            throw new RuntimeException("Erro 11:" + error);
        }
    }
    
}
