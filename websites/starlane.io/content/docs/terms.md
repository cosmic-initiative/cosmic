# TERMS

The Cosmic Initiative uses terms with an Astro Physics them in order to avoid name collision with other domains in the architecture.  For example a compute Node is called a Star and a Resource is called a Particle.


## UNIVERSAL TERMS
These are terms that exist in the Universal Dimension which is not concerned with security or orchestration.  Applications are typically built in this dimension in order to quicken development and centralize complexity.  
* **Particle** - A resource (User,File,Database, Database Row, Mechtron...etc.)
* **Kind** - a hierarchtical type descriptor for a particle.  A kind can be composed of a nested Base, Sub & a Specific to exactly describe a particle 
* **Point** - an address that in most cases is the location of a Particle
* **Wave** - A message that is transmitted to and from Particles
* **Mechtron** - A WebAssembly component that implements the `cosmic-universe` & `mechtron` packages giving it the ability to act as a Particle (send and receive Waves) 
* **Cosmos** - The entirety of the "World" that these Particles live in... The Entire Enterprise.
* **Cosmic Fabric** The space between Particles, the space that Waves traverse
* **Universal Dimension** - A simplified view and API of the Cosmos that is not concerned with security or orchestration. 

## HYPERVERSAL TERMS
The Hyperversal Dimension is the infrastructure view of the Cosmos which is responsible for security & orchestration and manages these concepts on behalf of the Universal Dimension.

* **Star** - A node/container for managing state and execution of Particles.  The Hyperverse distributes its provisioning of Particles amongst its Stars in order to spread computation load for storage, cpu & memory.
* **Lane** - Stars are connected via Lanes which serves as the transit mechanism for Waves
* * **Driver** - Particles are supported through Drivers.  Each Particle Kind has exactly one Driver
* **Registry** The Registry holds important information on where Particles live and security rules
* **Machine** - Although Stars are the 'node' component for managing Particles--the stars are more of 'virtual nodes' that live inside a Machine. The Machine will connect the internal Lanes between Stars, provide a service Stars within other Machines to connect & the Machine manages clients on behalf of its stars that are required to connect to other external Stars.   This architecture facilitates the rearrangement of infrastructure without the Stars needing any special knowledge of the Hyperverse cluster that it resides in.  For example in the standalone configuration ALL of the Stars execute on one Machine, and in yet another configuration each Star may have it's own Machine but in both cases the Stars see the Hyperverse the same without needing any special knowledge of how the Hyperverse cluster is composed.
