
import $ from 'jquery';
import Web3 from 'web3';
import TruffleContract from 'truffle-contract';
import artifact from '../../contracts/ToDo.sol';
import config from './config';
import { renderTasks } from './lib/render.js';



$(() => {
  const web3 = new Web3(new Web3.providers.HttpProvider(config.ethereumUrl));

  const abstraction = new TruffleContract(artifact);
  abstraction.setProvider(web3.currentProvider);

  const networks = Object.keys(artifact.networks);
  const network = networks[networks.length - 1];
  const address = artifact.networks[network].address;

  abstraction.at(address)
    .then((todo) => {
      return todo.getTaskFixtures(0)
    })
    .then((task) => {
      renderTasks($('#tasks'), [task]);
    });

});

