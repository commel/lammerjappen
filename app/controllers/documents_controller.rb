class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end
  
  def download
    @document = Document.find(params[:id])

    # ist das dokument derzeit verfügbar?
    redirect_to documents_path, :notice => 'Das Dokument wird derzeit bearbeitet!' and return if !@document.available
    
    # speichern, wer das dokument gezogen hat und das dokument heruntergeladen hat
    @document.available = false
    @document.user = current_user
    @document.save
    
   redirect_to @document.asset.url    
  end
  
  def free
    @document = Document.find(params[:id])
    @document.available = true
    @document.user = current_user
    @document.save
    
    redirect_to documents_path
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(params[:document])
    @document.user = current_user

    respond_to do |format|
      if @document.save
        format.html { redirect_to documents_path, :notice => 'Document was successfully created.' }
        format.json { render :json => @document, :status => :created, :location => @document }
      else
        format.html { render :action => "new" }
        format.json { render :json => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])
    @document.user = current_user
    
    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to documents_path, :notice => 'Document was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    
    @document.asset = nil
    @document.save
    
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :ok }
    end
  end
end
