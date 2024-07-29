import web3 from './web3';
import FarmerRegistryABI from './contracts/FarmerRegistry.json';
import CropCultivationABI from './contracts/CropCultivation.json';
import CultivatedLandNFTABI from './contracts/CultivatedLandNFT.json';
const farmerRegistry = new web3.eth.Contract(FarmerRegistryABI, 'FARMER_REGISTRY_CONTRACT_ADDRESS');
const cropCultivation = new web3.eth.Contract(CropCultivationABI, 'CROP_CULTIVATION_CONTRACT_ADDRESS');
const cultivatedLandNFT = new web3.eth.Contract(CultivatedLandNFTABI, 'CULTIVATED_LAND_NFT_CONTRACT_ADDRESS');

export { farmerRegistry, cropCultivation, cultivatedLandNFT };
