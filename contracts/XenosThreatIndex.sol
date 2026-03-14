// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Xenos Threat Index – pure text, no funds, no wallet interaction
/// @notice Stores the species, leader, and threat description of a xenos incursion.
/// @dev No payable functions, no selfdestruct, no external calls.

contract XenosThreatIndex {

    /// @notice Xenos species (Tyranids, Necrons, Orks, Aeldari, etc.)
    string public xenosSpecies;

    /// @notice Identified enemy leader, synapse node, overlord, warboss, etc.
    string public enemyLeader;

    /// @notice Description of the current threat level or event.
    string public threatDescription;

    /// @notice Emitted whenever someone updates the threat index.
    event ThreatUpdated(
        address indexed by,
        string newSpecies,
        string newLeader,
        string newThreat
    );

    constructor() {
        // Default: Tyranids – Hive Fleet Gorgon's Maw
        xenosSpecies = "Tyranids - Hive Fleet Gorgon's Maw";
        enemyLeader = "Synapse Node: Broodmind Echo";
        threatDescription = "Rapid biomass consumption detected across three frontier moons. Extermination protocols failing.";
    }

    /// @notice Update the xenos species, leader, and threat description.
    /// @dev Anyone can call this; it only updates text.
    function updateThreat(
        string calldata newSpecies,
        string calldata newLeader,
        string calldata newThreat
    ) external {
        xenosSpecies = newSpecies;
        enemyLeader = newLeader;
        threatDescription = newThreat;

        emit ThreatUpdated(msg.sender, newSpecies, newLeader, newThreat);
    }

    /// @notice Returns a combined description of the threat.
    function describeThreat() external view returns (string memory description) {
        description = string(
            abi.encodePacked(
                "Species: ",
                xenosSpecies,
                ". Leader: ",
                enemyLeader,
                ". Threat: ",
                threatDescription
            )
        );
    }
}
