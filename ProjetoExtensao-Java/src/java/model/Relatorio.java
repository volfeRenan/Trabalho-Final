package model;

public class Relatorio {

    private int idRel;
    private String atividadeRel;
    private String dataRel;
    private int fkProjeto;

    public int getIdRel() {
        return idRel;
    }

    public void setIdRel(int idRel) {
        this.idRel = idRel;
    }

    public String getAtividadeRel() {
        return atividadeRel;
    }

    public void setAtividadeRel(String atividadeRel) {
        this.atividadeRel = atividadeRel;
    }

    public String getDataRel() {
        return dataRel;
    }

    public void setDataRel(String dataRel) {
        this.dataRel = dataRel;
    }

    public int getFkProjeto() {
        return fkProjeto;
    }

    public void setFkProjeto(int fkProjeto) {
        this.fkProjeto = fkProjeto;
    }
        
}
