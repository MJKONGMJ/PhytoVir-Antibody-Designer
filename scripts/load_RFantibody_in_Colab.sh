#set colab python version t0 3.10
sudo update-alternatives --set python3 /usr/bin/python3.10

#clone the RFantibody repository
git clone https://github.com/RosettaCommons/RFantibody.git
cd RFantibody

#download weights and wheel files
mkdir weights && cd weights
wget https://files.ipd.uw.edu/pub/RFantibody/RFdiffusion_Ab.pt
wget https://files.ipd.uw.edu/pub/RFantibody/ProteinMPNN_v48_noise_0.2.pt
wget https://files.ipd.uw.edu/pub/RFantibody/RF2_ab.pt

cd /content/RFantibody/include
mkdir dgl && cd dgl
wget https://data.dgl.ai/wheels/torch-2.3/cu118/dgl-2.4.0%2Bcu118-cp310-cp310-manylinux1_x86_64.whl

#install dependencies
cd /content/RFantibody
    ## create & activate a virtual env for RFantibody
apt-get update
apt-get install -y python3-pip python3.10-venv
python3 -m venv rfantibody_env
source rfantibody_env/bin/activate
pip install poetry
poetry config virtualenvs.in-project true
poetry config virtualenvs.create false
poetry install --no-ansi
    ## build USalign
cd /content/RFantibody/include/USalign && make
